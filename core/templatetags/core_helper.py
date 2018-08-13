import logging

import re
from collections import OrderedDict

from django.db.models import Q, Sum, Count
from random import randint
from urllib.parse import parse_qs

from django import template
from django.utils.timezone import *

from core.models import *
from project import settings

_logger = logging.getLogger()
register = template.Library()
numeric_test = re.compile("^\d+$")


# settings value
@register.simple_tag
def settings_value(name):
    return getattr(settings, name, "")


@register.filter
def youtube(value, args):
    """
     returns youtube thumb url
    args s, l (small, large)

    """
    qs = value.split('?')
    video_id = parse_qs(qs[1])['v'][0]

    if args == 's':
        return "http://img.youtube.com/vi/%s/2.jpg" % video_id
    elif args == 'l':
        return "http://img.youtube.com/vi/%s/0.jpg" % video_id
    else:
        return None


@register.filter()
def display_not_none(value):
    if value is not None:
        return value
    return ''


@register.simple_tag()
def odd_or_even_class(value):
    return 'gray-bg' if value % 2 == 0 else 'gray-lighter'


@register.simple_tag
def load_menu_items():

    res = OrderedDict()
    res['index'] = 'Home'
    res['fixtures'] = 'Fixtures'
    res['results'] = 'Results'
    res['tables'] = 'Tables'
    res['clubs'] = 'Clubs'
    res['players'] = 'Players'
    res['managers'] = 'Managers'
    res['news'] = 'News'
    res['galleries'] = 'Galleries'

    return res


@register.inclusion_tag("frontend/partials/right_index.html")
def right_content(club_id=None):
    """
      Load the right content for general and club details
      All matches must be end before current time.
    """
    right_clean_sheet = []
    right_league_table = Club.objects.raw("""
                select
              t1.*,
              COUNT(t2.id) as mp,
              SUM(CASE WHEN (t1.id = t2.home_team_id)
                THEN (t2.home_end_score - t2.away_end_score)
                  ELSE (t2.away_end_score - t2.home_end_score) END) as gp,
              SUM(CASE WHEN (t1.id = t2.home_team_id AND (t2.home_end_score > t2.away_end_score)) OR
                            (t1.id = t2.away_team_id AND (t2.away_end_score > t2.home_end_score))
                THEN 3
                  WHEN (t2.home_end_score = t2.away_end_score)
                    THEN 1
                  ELSE 0 END)  as num_pts
            from core_club t1
              join core_match t2 on t1.id = t2.home_team_id or t1.id = t2.away_team_id
              WHERE DATE_FORMAT(t2.end_time, '%%Y-%%m-%%d %%H:%%i:%%s') <= NOW()          
            GROUP BY t1.id
            ORDER BY num_pts DESC LIMIT 5
    """)

    right_top_score = Player.objects.raw("""
       SELECT t1.*, 
       SUM(CASE WHEN t2.is_score = True THEN 1 ELSE 0 END) as num_score, 
       SUM(CASE WHEN t2.is_penalty = True THEN 1 ELSE 0 END) as num_score_penalty from core_player t1 
       LEFT join core_matchdetail t2 on t1.id = t2.player_id  
       LEFT join core_match t3 on t2.match_id = t3.id  
       WHERE DATE_FORMAT(t3.end_time, '%%Y-%%m-%%d %%H:%%i:%%s') <= NOW()      
       GROUP BY t1.id
       ORDER BY num_score DESC LIMIT 5
    """)

    if club_id is None:
        right_clean_sheet = Player.objects.raw("""
          SELECT t1.*, COUNT(t1.id) as num_clean_sheet FROM core_player t1 left join core_position t4 on t1.position_id = t4.id
          left join core_club t2 on t1.club_id = t2.id 
          left join core_match t3 on (t2.id = t3.home_team_id or t2.id = t3.away_team_id)
          where (
          (t2.id = t3.home_team_id AND t3.away_end_score = 0) 
          OR (t2.id = t3.away_team_id AND t3.home_end_score = 0)
          ) AND t4.is_goal_keeper = True 
           AND DATE_FORMAT(t3.end_time, '%%Y-%%m-%%d %%H:%%i:%%s') <= NOW()                
           GROUP BY t1.id
           ORDER BY num_clean_sheet DESC LIMIT 5        
        """)

    right_banner_index = Banner.objects.filter(status=True).filter(position__position_key='right_index')

    return {
        'league_table': right_league_table,
        'top_score': right_top_score,
        'clean_sheet': right_clean_sheet,
        'banner_index': right_banner_index,
    }


@register.filter
def number_if_none(value):
    if value is not None:
        return value
    return 0


@register.simple_tag
def header_club_list():
    return Club.objects.all()[:5]


@register.simple_tag
def sponsor_list():
    return Sponsor.objects.all()[:5]


@register.simple_tag
def get_next_match_club(value):
    next_match = Match.objects.filter(status=True).filter(Q(home_team_id=value) | Q(home_team_id=value)).filter(
        start_time__gt=now()).first()

    if next_match:
        return next_match.home_team if next_match.home_team.id != value else next_match.away_team
    return


@register.simple_tag
def get_clubs():
    return Club.objects.filter(status=True)


@register.simple_tag
def get_players():
    return Player.objects.filter(status=True)


@register.simple_tag
def get_coaches():
    return Coach.objects.filter(status=True)


@register.simple_tag
def get_matches():
    matches = Match.objects.filter(status=True)
    for match in matches:
        match.name = match.get_name()
    return matches


@register.simple_tag
def get_categories():
    return Category.objects.filter(status=True)


@register.simple_tag
def get_banner_positions():
    return BannerPosition.objects.filter(status=True)
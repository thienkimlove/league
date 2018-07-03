import logging
import subprocess

from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render, redirect
from datetime import datetime, timedelta
# Create your views here.
from django.utils.timezone import now

from core.models import *

_logger = logging.getLogger()


def reload(request):
    response = subprocess.Popen(['sh', '/var/www/html/league/restart.sh'], stdout=subprocess.PIPE)

    # out, err = response.communicate()

    return HttpResponse("OK")


def load_fixture_or_result(request, fixture=False):
    seasons = Season.objects.filter(status=True).all()
    clubs = Club.objects.filter(status=True).all()
    banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()
    results = Match.objects.filter(status=True)

    if request.GET.get('season'):
        results = results.filter(league__season=request.GET.get('season'))

    if request.GET.get('club'):
        results = results.filter(Q(home_team=request.GET.get('club')) | Q(away_team=request.GET.get('club')))

    if fixture is True:
        page = 'fixtures'
        results.filter(start_time__gte=now())
    else:
        page = 'results'
        results.filter(end_time__lte=now())

    return render(request, 'frontend/results.html', {
        'seasons': seasons,
        'clubs': clubs,
        'page': page,
        'banners': banners,
        'results': results,
    })


def load_index(club=None):
    page = 'clubs' if club is not None else 'index'
    match_this_weeks = []
    main_club_id = None
    block_1_posts = Post.objects.filter(status=True).filter(display_place='block_1')
    block_2_posts = Post.objects.filter(status=True).filter(display_place='block_2')
    index_banner_1 = Banner.objects.filter(status=True).filter(position__position_key='index_1')
    index_banner_2 = Banner.objects.filter(status=True).filter(position__position_key='index_2')
    socials = Social.objects.filter(status=True)
    galleries = Gallery.objects.filter(status=True)
    if club:
        block_1_posts = block_1_posts.filter(clubs__in=[club])
        block_2_posts = block_2_posts.filter(clubs__in=[club])
        galleries = galleries.filter(clubs__in=[club])
        socials = socials.filter(clubs__in=[club])
        main_club_id = club.id if hasattr(club, 'id') else None
    else:
        match_this_weeks = Match.objects.filter(start_time__gte=now()).order_by('-created_at')[:5]

    block_1_posts = block_1_posts.order_by('-created_at')[:4]
    block_2_posts = block_2_posts.order_by('-created_at')[:4]
    galleries = galleries.order_by('-created_at')[:4]
    socials = socials.order_by('-created_at')[:4]
    sponsors = Sponsor.objects.all()[:5]

    return {
        'block_1_posts': block_1_posts,
        'index_banner_1': index_banner_1,
        'index_banner_2': index_banner_2,
        'block_2_posts': block_2_posts,
        'galleries': galleries,
        'socials': socials,
        'match_this_weeks': match_this_weeks,
        'sponsors': sponsors,
        'page': page,
        'main_club_id': main_club_id,
    }


def index(request):
    return render(request, 'frontend/index.html', load_index())


def news(request):
    page = 'news'
    banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()
    active_category = None
    categories = Category.objects.all()

    if request.GET.get('category'):
        active_category = Category.objects.filter(slug=request.GET.get('category')).first()
        posts = Post.objects.filter(status=True).filter(category=active_category)[:5]
    else:
        posts = Post.objects.filter(status=True)[:5]

    return render(request, 'frontend/news.html', {
        'banners': banners,
        'active_category': active_category,
        'posts': posts,
        'categories': categories,
        'page': page,
    })


def results(request):
    return load_fixture_or_result(request)


def fixtures(request):
    return load_fixture_or_result(request, fixture=True)


def tables(request):
    page = 'tables'
    seasons = Season.objects.filter(status=True).all()
    banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()

    where = "WHERE DATE_FORMAT(t2.end_time, '%%Y-%%m-%%d %%H:%%i:%%s') <= NOW()"

    if request.GET.get('match_week') and request.GET.get('match_week') == '1':
        where += """
           AND DATE_FORMAT(t2.start_time, '%%Y-%%m-%%d') > 
               DATE_FORMAT((SELECT CURDATE() - INTERVAL (WEEKDAY(CURDATE())+1) DAY), '%%Y-%%m-%%d') 
        """

        if request.GET.get('season'):
            where += " AND t3.season_id={0}".format(request.GET.get('season'))
    else:
        if request.GET.get('season'):
            where += " AND t3.season_id=" + request.GET.get('season')

    tables = Club.objects.raw("""
          select
              t1.*,
              COUNT(t2.id) as mp, 
              SUM(CASE WHEN (t1.id = t2.home_team_id) THEN t2.home_end_score ELSE t2.away_end_score END) as gf,
               SUM(CASE WHEN (t1.id = t2.home_team_id) THEN t2.away_end_score ELSE t2.home_end_score END) as ga,
               
               SUM(CASE WHEN (((t1.id = t2.home_team_id) AND (t2.home_end_score >t2.away_end_score)) 
               OR (t1.id = t2.away_team_id) AND (t2.away_end_score >t2.home_end_score)) THEN 1 ELSE 0 END) as win,
               
                SUM(CASE WHEN (t2.away_end_score=t2.home_end_score) THEN 1 ELSE 0 END) as draw,
               
               SUM(CASE WHEN (((t1.id = t2.home_team_id) AND (t2.away_end_score >t2.home_end_score)) 
               OR (t1.id = t2.away_team_id) AND (t2.home_end_score >t2.away_end_score)) THEN 1 ELSE 0 END) as lost,
               
              SUM(CASE WHEN (t1.id = t2.home_team_id)
                THEN (t2.home_end_score - t2.away_end_score)
                  ELSE (t2.away_end_score - t2.home_end_score) END) as gd,
              SUM(CASE WHEN (t1.id = t2.home_team_id AND (t2.home_end_score > t2.away_end_score)) OR
                            (t1.id = t2.away_team_id AND (t2.away_end_score > t2.home_end_score))
                THEN 3
                  WHEN (t2.home_end_score = t2.away_end_score)
                    THEN 1
                  ELSE 0 END) as num_pts
            from core_club t1
              join core_match t2 on t1.id = t2.home_team_id or t1.id = t2.away_team_id
              join core_league t3 on t2.league_id = t3.id             
            %s
            GROUP BY t1.id
            ORDER BY num_pts DESC
    """ % where)

    return render(request, 'frontend/tables.html', {
        'seasons': seasons,
        'page': page,
        'banners': banners,
        'tables': tables,
    })


def galleries(request):
    page = 'galleries'
    banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()
    list_galleries = Gallery.objects.filter(status=True)[:5]
    return render(request, 'frontend/galleries.html', {
        'banners': banners,
        'list_galleries': list_galleries,
        'page': page
    })


def managers(request):
    page = 'managers'
    banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()
    managers = Coach.objects.filter(status=True)
    if request.GET.get('club'):
        managers = managers.filter(club=request.GET.get('club'))

    clubs = Club.objects.filter(status=True).all()
    return render(request, 'frontend/managers.html', {
        'banners': banners,
        'managers': managers,
        'page': page,
        'clubs': clubs,
    })


def clubs(request):
    page = 'clubs'
    list_clubs = Club.objects.filter(status=True).all()
    seasons = Season.objects.filter(status=True).all()
    return render(request, 'frontend/clubs.html', {
        'list_clubs': list_clubs,
        'page': page,
        'seasons': seasons,
    })


def players(request):
    page = 'players'
    banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()
    clubs = Club.objects.filter(status=True).all()
    players = Player.objects.filter(status=True)
    if request.GET.get('club'):
        players = players.filter(club=request.GET.get('club'))
    return render(request, 'frontend/players.html', {
        'banners': banners,
        'players': players,
        'page': page,

        'clubs': clubs,
    })


def news_detail(request, slug):
    page = 'news'
    post = Post.objects.filter(slug=slug).first()
    if post:
        banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()
        return render(request, 'frontend/news_detail.html', {'banners': banners, 'post': post, 'page': page})
    else:
        return redirect('frontend:index')


def clubs_detail(request, slug):
    club = Club.objects.filter(slug=slug).first()
    if club:
        return render(request, 'frontend/clubs_detail.html', load_index(club))
    else:
        return redirect('frontend:index')


def galleries_detail(request, slug):
    page = 'galleries'
    gallery = Gallery.objects.filter(slug=slug).first()
    if gallery:
        banners = Banner.objects.filter(status=True).filter(position__position_key='normal_page').all()
        return render(request, 'frontend/galleries_detail.html', {'banners': banners, 'gallery': gallery, 'page': page})
    else:
        return redirect('frontend:index')


def ajax(request):
    pass

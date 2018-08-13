from django.contrib.auth import logout
from django.core import serializers
from django.http import HttpResponse
from core.helpers import *
from core.models import *


def player_by_club_json(request):

    home_club_id = request.GET.get('home_club_id')
    away_club_id = request.GET.get('away_club_id')

    if home_club_id and away_club_id:
        data = Player.objects.filter(club_id__in=(home_club_id, away_club_id))
        data = serializers.serialize('json', list(data), fields=('name',))
        return HttpResponse(data, content_type='application/json')


def backend_index(request):
    if not request.user.is_authenticated:
        return redirect(reverse_lazy('core:login'))


    return render(request, 'core/index.html', {
        'match_number': Match.objects.count(),
        'player_number': Player.objects.count(),
        'club_number': Club.objects.count(),
        'user_number': User.objects.count(),
    })


def log_out(request):
    logout(request)
    return redirect(reverse_lazy('core:login'))


def list_stadium(request):
    return list_content(request, 'stadium')


def edit_stadium(request, item_id):
    return edit_content(request, 'stadium', item_id)


def create_stadium(request):
    return create_content(request, 'stadium')


def delete_stadium(request, item_id):
    return delete_content(request, 'stadium', item_id)


def list_season(request):
    return list_content(request, 'season')


def edit_season(request, item_id):
    return edit_content(request, 'season', item_id)


def create_season(request):
    return create_content(request, 'season')


def delete_season(request, item_id):
    return delete_content(request, 'season', item_id)


def list_position(request):
    return list_content(request, 'position')


def edit_position(request, item_id):
    return edit_content(request, 'position', item_id)


def create_position(request):
    return create_content(request, 'position')


def delete_position(request, item_id):
    return delete_content(request, 'position', item_id)


def list_league(request):
    return list_content(request, 'league')


def edit_league(request, item_id):
    return edit_content(request, 'league', item_id)


def create_league(request):
    return create_content(request, 'league')


def delete_league(request, item_id):
    return delete_content(request, 'league', item_id)


def list_club(request):
    return list_content(request, 'club')


def edit_club(request, item_id):
    return edit_content(request, 'club', item_id)


def create_club(request):
    return create_content(request, 'club')


def delete_club(request, item_id):
    return delete_content(request, 'club', item_id)


def list_player(request):
    return list_content(request, 'player')


def edit_player(request, item_id):
    return edit_content(request, 'player', item_id)


def create_player(request):
    return create_content(request, 'player')


def delete_player(request, item_id):
    return delete_content(request, 'player', item_id)


def list_player_history(request):
    return list_content(request, 'player_history')


def delete_player_history(request, item_id):
    return delete_content(request, 'player_history', item_id)


def list_referee(request):
    return list_content(request, 'referee')


def edit_referee(request, item_id):
    return edit_content(request, 'referee', item_id)


def create_referee(request):
    return create_content(request, 'referee')


def delete_referee(request, item_id):
    return delete_content(request, 'referee', item_id)


def list_coach(request):
    return list_content(request, 'coach')


def edit_coach(request, item_id):
    return edit_content(request, 'coach', item_id)


def create_coach(request):
    return create_content(request, 'coach')


def delete_coach(request, item_id):
    return delete_content(request, 'coach', item_id)


def list_coach_history(request):
    return list_content(request, 'coach_history')


def delete_coach_history(request, item_id):
    return delete_content(request, 'coach_history', item_id)


def list_match(request):
    return list_content(request, 'match')


def edit_match(request, item_id):
    return edit_content(request, 'match', item_id)


def create_match(request):
    return create_content(request, 'match')


def delete_match(request, item_id):
    return delete_content(request, 'match', item_id)


def list_match_detail(request):
    return list_content(request, 'match_detail')


def edit_match_detail(request, item_id):
    return edit_content(request, 'match_detail', item_id)


def create_match_detail(request):
    return create_content(request, 'match_detail')


def delete_match_detail(request, item_id):
    return delete_content(request, 'match_detail', item_id)


def list_match_action(request):
    return list_content(request, 'match_action')


def edit_match_action(request, item_id):
    return edit_content(request, 'match_action', item_id)


def create_match_action(request):
    return create_content(request, 'match_action')


def delete_match_action(request, item_id):
    return delete_content(request, 'match_action', item_id)


def list_category(request):
    return list_content(request, 'category')


def edit_category(request, item_id):
    return edit_content(request, 'category', item_id)


def create_category(request):
    return create_content(request, 'category')


def delete_category(request, item_id):
    return delete_content(request, 'category', item_id)


def list_post(request):
    return list_content(request, 'post')


def edit_post(request, item_id):
    return edit_content(request, 'post', item_id)


def create_post(request):
    return create_content(request, 'post')


def delete_post(request, item_id):
    return delete_content(request, 'post', item_id)


def list_banner(request):
    return list_content(request, 'banner')


def edit_banner(request, item_id):
    return edit_content(request, 'banner', item_id)


def create_banner(request):
    return create_content(request, 'banner')


def delete_banner(request, item_id):
    return delete_content(request, 'banner', item_id)


def list_banner_position(request):
    return list_content(request, 'banner_position')


def edit_banner_position(request, item_id):
    return edit_content(request, 'banner_position', item_id)


def create_banner_position(request):
    return create_content(request, 'banner_position')


def delete_banner_position(request, item_id):
    return delete_content(request, 'banner_position', item_id)


def list_social(request):
    return list_content(request, 'social')


def edit_social(request, item_id):
    return edit_content(request, 'social', item_id)


def create_social(request):
    return create_content(request, 'social')


def delete_social(request, item_id):
    return delete_content(request, 'social', item_id)


def list_sponsor(request):
    return list_content(request, 'sponsor')


def edit_sponsor(request, item_id):
    return edit_content(request, 'sponsor', item_id)


def create_sponsor(request):
    return create_content(request, 'sponsor')


def delete_sponsor(request, item_id):
    return delete_content(request, 'sponsor', item_id)


def list_gallery(request):
    return list_content(request, 'gallery')


def edit_gallery(request, item_id):
    return edit_content(request, 'gallery', item_id)


def create_gallery(request):
    return create_content(request, 'gallery')


def delete_gallery(request, item_id):
    return delete_content(request, 'gallery', item_id)
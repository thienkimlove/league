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
    return render(request, 'core/index.html', {})


def log_out(request):
    logout(request)
    return redirect(reverse_lazy('core:login'))


def list_stadium(request):
    return list_content(request, 'stadium')


def edit_stadium(request, item_id):
    return edit_content(request, 'stadium', item_id)


def create_stadium(request):
    return create_content(request, 'stadium')


def list_season(request):
    return list_content(request, 'season')


def edit_season(request, item_id):
    return edit_content(request, 'season', item_id)


def create_season(request):
    return create_content(request, 'season')
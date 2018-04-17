from django.core import serializers
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from core.models import *


def player_by_club_json(request):

    home_club_id = request.GET.get('home_club_id')
    away_club_id = request.GET.get('away_club_id')

    if home_club_id and away_club_id:
        data = Player.objects.filter(club_id__in=(home_club_id, away_club_id))
        data = serializers.serialize('json', list(data), fields=('name',))
        return HttpResponse(data, content_type='application/json')

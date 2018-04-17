from django.core.management.base import BaseCommand
from django.core.cache import cache

from core.models import *


class Command(BaseCommand):
    def handle(self, *args, **kwargs):
       statium1 = Stadium.objects.create(name='San Lach Tray')
       statium2 = Stadium.objects.create(name='San Hang Day')
       position1 = Position.objects.create(name='Hau ve')
       position2 = Position.objects.create(name='Tien Dao')
       refere = Referee.objects.create(name='Trong tai 1')

       season = Season.objects.create(name='2017-1018')
       league = League.objects.create(season=season, name='Vietnam Championship')
       club1 = Club.objects.create(name='HP', stadium=statium1)
       club2 = Club.objects.create(name='HN', stadium=statium2)

       player1 = Player.objects.create(position=position1, name='Manh quan1', club=club1)
       player2 = Player.objects.create(position=position2, name='Manh quan2', club=club1)
       player3 = Player.objects.create(position=position2, name='Manh quan3', club=club2)
       player4 = Player.objects.create(position=position1, name='Manh quan4', club=club2)
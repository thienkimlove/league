from django.contrib.auth.decorators import login_required
from django.urls import path

from core.classes import *
from core.views import *

app_name = "core"


urlpatterns = [
    path('tag-autocomplete/', TagAutoComplete.as_view(), name='tag_autocomplete'),
    path('players/', player_by_club_json, name='player_by_club'),

    path('login/', LogInView.as_view(), name='login'),
    path('logout/', log_out, name='logout'),
    path('', backend_index, name="backend_index"),


    path('stadiums/', list_stadium, name='stadium_list'),
    path('stadiums/data_table/', login_required(StadiumListJson.as_view()), name='stadium_data_table'),
    path('stadiums/edit/<item_id>/', edit_stadium, name='stadium_edit'),
    path('stadiums/create/', create_stadium, name='stadium_create'),

    path('seasons/', list_season, name='season_list'),
    path('seasons/data_table/', login_required(SeasonListJson.as_view()), name='season_data_table'),
    path('seasons/edit/<item_id>/', edit_season, name='season_edit'),
    path('seasons/create/', create_season, name='season_create'),


]
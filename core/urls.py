from django.contrib.auth.decorators import login_required
from django.urls import path

from core.classes import *
from core.views import *

app_name = "core"


urlpatterns = [
    path('tag-autocomplete/', TagAutoComplete.as_view(), name='tag_autocomplete'),
    # path('players/', player_by_club_json, name='player_by_club'),

    path('login/', LogInView.as_view(), name='login'),
    path('logout/', log_out, name='logout'),
    path('', backend_index, name="backend_index"),


    path('stadiums/', list_stadium, name='stadium_list'),
    path('stadiums/data_table/', login_required(StadiumListJson.as_view()), name='stadium_data_table'),
    path('stadiums/edit/<item_id>/', edit_stadium, name='stadium_edit'),
    path('stadiums/delete/<item_id>/', delete_stadium, name='stadium_delete'),
    path('stadiums/create/', create_stadium, name='stadium_create'),

    path('seasons/', list_season, name='season_list'),
    path('seasons/data_table/', login_required(SeasonListJson.as_view()), name='season_data_table'),
    path('seasons/edit/<item_id>/', edit_season, name='season_edit'),
    path('seasons/delete/<item_id>/', delete_season, name='season_delete'),
    path('seasons/create/', create_season, name='season_create'),

    path('positions/', list_position, name='position_list'),
    path('positions/data_table/', login_required(PositionListJson.as_view()), name='position_data_table'),
    path('positions/edit/<item_id>/', edit_position, name='position_edit'),
    path('positions/delete/<item_id>/', delete_position, name='position_delete'),
    path('positions/create/', create_position, name='position_create'),


    path('leagues/', list_league, name='league_list'),
    path('leagues/data_table/', login_required(LeagueListJson.as_view()), name='league_data_table'),
    path('leagues/edit/<item_id>/', edit_league, name='league_edit'),
    path('leagues/delete/<item_id>/', delete_league, name='league_delete'),
    path('leagues/create/', create_league, name='league_create'),

    path('clubs/', list_club, name='club_list'),
    path('clubs/data_table/', login_required(ClubListJson.as_view()), name='club_data_table'),
    path('clubs/edit/<item_id>/', edit_club, name='club_edit'),
    path('clubs/delete/<item_id>/', delete_club, name='club_delete'),
    path('clubs/create/', create_club, name='club_create'),

    path('players/', list_player, name='player_list'),
    path('players/data_table/', login_required(PlayerListJson.as_view()), name='player_data_table'),
    path('players/edit/<item_id>/', edit_player, name='player_edit'),
    path('players/delete/<item_id>/', delete_player, name='player_delete'),
    path('players/create/', create_player, name='player_create'),

    path('player_histories/', list_player_history, name='player_history_list'),
    path('player_histories/data_table/', login_required(PlayerHistoryListJson.as_view()), name='player_history_data_table'),
    path('player_histories/delete/<item_id>/', delete_player_history, name='player_history_delete'),


    path('referees/', list_referee, name='referee_list'),
    path('referees/data_table/', login_required(RefereeListJson.as_view()), name='referee_data_table'),
    path('referees/edit/<item_id>/', edit_referee, name='referee_edit'),
    path('referees/delete/<item_id>/', delete_referee, name='referee_delete'),
    path('referees/create/', create_referee, name='referee_create'),

]
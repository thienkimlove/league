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

    path('coaches/', list_coach, name='coach_list'),
    path('coaches/data_table/', login_required(CoachListJson.as_view()), name='coach_data_table'),
    path('coaches/edit/<item_id>/', edit_coach, name='coach_edit'),
    path('coaches/delete/<item_id>/', delete_coach, name='coach_delete'),
    path('coaches/create/', create_coach, name='coach_create'),

    path('coach_histories/', list_coach_history, name='coach_history_list'),
    path('coach_histories/data_table/', login_required(CoachHistoryListJson.as_view()), name='coach_history_data_table'),
    path('coach_histories/delete/<item_id>/', delete_coach_history, name='coach_history_delete'),

    path('matches/', list_match, name='match_list'),
    path('matches/data_table/', login_required(MatchListJson.as_view()), name='match_data_table'),
    path('matches/edit/<item_id>/', edit_match, name='match_edit'),
    path('matches/delete/<item_id>/', delete_match, name='match_delete'),
    path('matches/create/', create_match, name='match_create'),

    path('match_details/', list_match_detail, name='match_detail_list'),
    path('match_details/data_table/', login_required(MatchDetailListJson.as_view()), name='match_detail_data_table'),
    path('match_details/edit/<item_id>/', edit_match_detail, name='match_detail_edit'),
    path('match_details/delete/<item_id>/', delete_match_detail, name='match_detail_delete'),
    path('match_details/create/', create_match_detail, name='match_detail_create'),


    path('match_actions/', list_match_action, name='match_action_list'),
    path('match_actions/data_table/', login_required(MatchActionListJson.as_view()), name='match_action_data_table'),
    path('match_actions/edit/<item_id>/', edit_match_action, name='match_action_edit'),
    path('match_actions/delete/<item_id>/', delete_match_action, name='match_action_delete'),
    path('match_actions/create/', create_match_action, name='match_action_create'),


    path('categories/', list_category, name='category_list'),
    path('categories/data_table/', login_required(CategoryListJson.as_view()), name='category_data_table'),
    path('categories/edit/<item_id>/', edit_category, name='category_edit'),
    path('categories/delete/<item_id>/', delete_category, name='category_delete'),
    path('categories/create/', create_category, name='category_create'),

    path('posts/', list_post, name='post_list'),
    path('posts/data_table/', login_required(PostListJson.as_view()), name='post_data_table'),
    path('posts/edit/<item_id>/', edit_post, name='post_edit'),
    path('posts/delete/<item_id>/', delete_post, name='post_delete'),
    path('posts/create/', create_post, name='post_create'),

    path('banners/', list_banner, name='banner_list'),
    path('banners/data_table/', login_required(BannerListJson.as_view()), name='banner_data_table'),
    path('banners/edit/<item_id>/', edit_banner, name='banner_edit'),
    path('banners/delete/<item_id>/', delete_banner, name='banner_delete'),
    path('banners/create/', create_banner, name='banner_create'),

    path('banner_positions/', list_banner_position, name='banner_position_list'),
    path('banner_positions/data_table/', login_required(BannerPositionListJson.as_view()), name='banner_position_data_table'),
    path('banner_positions/edit/<item_id>/', edit_banner_position, name='banner_position_edit'),
    path('banner_positions/delete/<item_id>/', delete_banner_position, name='banner_position_delete'),
    path('banner_positions/create/', create_banner_position, name='banner_position_create'),

    path('galleries/', list_gallery, name='gallery_list'),
    path('galleries/data_table/', login_required(GalleryListJson.as_view()), name='gallery_data_table'),
    path('galleries/edit/<item_id>/', edit_gallery, name='gallery_edit'),
    path('galleries/delete/<item_id>/', delete_gallery, name='gallery_delete'),
    path('galleries/create/', create_gallery, name='gallery_create'),

    path('sponsors/', list_sponsor, name='sponsor_list'),
    path('sponsors/data_table/', login_required(SponsorListJson.as_view()), name='sponsor_data_table'),
    path('sponsors/edit/<item_id>/', edit_sponsor, name='sponsor_edit'),
    path('sponsors/delete/<item_id>/', delete_sponsor, name='sponsor_delete'),
    path('sponsors/create/', create_sponsor, name='sponsor_create'),

    path('socials/', list_social, name='social_list'),
    path('socials/data_table/', login_required(SocialListJson.as_view()), name='social_data_table'),
    path('socials/edit/<item_id>/', edit_social, name='social_edit'),
    path('socials/delete/<item_id>/', delete_social, name='social_delete'),
    path('socials/create/', create_social, name='social_create'),

]
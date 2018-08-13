from dal import autocomplete
from django.contrib.auth import REDIRECT_FIELD_NAME, login
from django.shortcuts import redirect
from django.urls import reverse_lazy, reverse
from django.utils.decorators import method_decorator
from django.utils.http import is_safe_url
from django.utils.safestring import mark_safe
from django.views import View
from django.views.decorators.cache import never_cache
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.debug import sensitive_post_parameters
from django.views.generic import FormView
from django_datatables_view.base_datatable_view import BaseDatatableView
from taggit.models import Tag
from django.utils.translation import gettext_lazy as _

from core.forms import SignInViaUsernameForm
from core.helpers import *
from core.models import *
from project import settings

DISPLAY_CHOICES = {
    'block_1': _("Vị trí trung tâm trang chủ"),
    'block_2': _("Block 2 trang chủ")
}

SOCIAL_CHOICES = {
    'facebook': _('Facebook'),
    'google': _('Google'),
    'twitter': _('Twitter'),
}



class GuestOnlyView(View):
    def dispatch(self, request, *args, **kwargs):
        # Redirect to the index page if the user already authenticated
        if request.user.is_authenticated:
            return redirect(settings.LOGIN_REDIRECT_URL)

        return super().dispatch(request, *args, **kwargs)


class LoginOnlyView(View):
    def dispatch(self, request, *args, **kwargs):
        # Redirect to the index page if the user already authenticated
        if not request.user.is_authenticated:
            return redirect(reverse_lazy('core:login'))

        return super().dispatch(request, *args, **kwargs)


class LogInView(GuestOnlyView, FormView):
    template_name = 'core/login.html'

    @staticmethod
    def get_form_class(**kwargs):
        return SignInViaUsernameForm

    @method_decorator(sensitive_post_parameters('password'))
    @method_decorator(csrf_protect)
    @method_decorator(never_cache)
    def dispatch(self, request, *args, **kwargs):
        # Sets a test cookie to make sure the user has cookies enabled
        request.session.set_test_cookie()

        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        request = self.request

        # If the test cookie worked, go ahead and delete it since its no longer needed
        if request.session.test_cookie_worked():
            request.session.delete_test_cookie()

        # The default Django's "remember me" lifetime is 2 weeks and can be changed by modifying
        # the SESSION_COOKIE_AGE settings' option.
        if settings.USE_REMEMBER_ME:
            if not form.cleaned_data['remember_me']:
                request.session.set_expiry(0)

        login(request, form.user_cache)

        redirect_to = request.POST.get(REDIRECT_FIELD_NAME, request.GET.get(REDIRECT_FIELD_NAME))
        url_is_safe = is_safe_url(redirect_to, allowed_hosts=request.get_host(), require_https=request.is_secure())

        if url_is_safe:
            return redirect(redirect_to)

        return redirect(reverse_lazy('core:backend_index'))


class TagAutoComplete(autocomplete.Select2QuerySetView):
    def get_queryset(self):
        qs = Tag.objects.all()
        if self.q:
            qs = qs.filter(name__istartswith=self.q)
        return qs


class ListJson(BaseDatatableView):
    # set max limit of records returned, this is used to protect our site if someone tries to attack our site
    # and make it return huge amount of data
    max_display_length = 500


class StadiumListJson(ListJson):
    model = Stadium

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:stadium_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:stadium_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "capable": item.capable,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "image": '<img width="100" height="auto" src="%s" />' % item.image.url if item.image else '',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class SeasonListJson(ListJson):
    model = Season

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:season_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:season_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "start_date": item.start_date.strftime('%Y-%m-%d') if item.start_date else '',
                "end_date": item.end_date.strftime('%Y-%m-%d') if item.end_date else '',
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class PositionListJson(ListJson):
    model = Position

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:position_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:position_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "is_goal_keeper": "Yes" if item.is_goal_keeper else "No",
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class LeagueListJson(ListJson):
    model = League

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:league_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:league_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "season": item.season.name if item.season else '',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class ClubListJson(ListJson):
    model = Club

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:club_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:club_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "website": item.website,
                "stadium": item.stadium.name if item.stadium else '',
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "background_img": '<img width="100" height="auto" src="'+item.background_img.url+'" />' if item.background_img else '',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class PlayerListJson(ListJson):
    model = Player

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_player(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Histories" href="' + reverse('core:player_history_list') + '?player_id='+str(item.id)+'"><i class="fa fa-tasks text-success"></i></a><a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:player_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:player_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "weight": item.weight,
                "height": item.height,
                "nationality": item.nationality.name,
                "dob": item.dob,
                "position": item.position.name if item.position else '',
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "club": item.club.name if item.club else '',
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class PlayerHistoryListJson(ListJson):
    model = PlayerHistory

    order_columns = [
        'club',
        'player',
        'date',
        'action',
    ]

    def filter_queryset(self, qs):
        return filter_player_history(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:player_history_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "player": item.player.name if item.player else '',
                "club": item.club.name if item.club else '',
                "date": item.date.strftime('%Y-%m-%d'),
                "action": mark_safe(action),
            })
        return json_data


class RefereeListJson(ListJson):
    model = Referee

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:referee_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:referee_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "weight": item.weight,
                "height": item.height,
                "nationality": item.nationality.name,
                "dob": item.dob,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class CoachListJson(ListJson):
    model = Coach

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_player(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Histories" href="' + reverse('core:coach_history_list') + '?coach_id='+str(item.id)+'"><i class="fa fa-tasks text-success"></i></a><a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:coach_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:coach_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "weight": item.weight,
                "height": item.height,
                "nationality": item.nationality.name,
                "dob": item.dob,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "club": item.club.name if item.club else '',
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class CoachHistoryListJson(ListJson):
    model = CoachHistory

    order_columns = [
        'club',
        'coach',
        'date',
        'action',
    ]

    def filter_queryset(self, qs):
        return filter_coach_history(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:coach_history_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "coach": item.coach.name if item.coach else '',
                "club": item.club.name if item.club else '',
                "date": item.date.strftime('%Y-%m-%d'),
                "action": mark_safe(action),
            })
        return json_data


class MatchListJson(ListJson):

    model = Match

    # define the columns that will be returned
    order_columns = [
        'home_team',
        'away_team',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_match(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Match Details" href="' + reverse('core:match_detail_list') + '?match_id='+str(item.id)+'"><i class="fa fa-tasks text-success"></i></a><a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:match_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:match_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "home_team": item.home_team.name,
                "away_team": item.away_team.name,
                "start_home_team": ','.join(x.name for x in item.start_home_team.all()),
                "start_away_team": ','.join(x.name for x in item.start_home_team.all()),
                "referee": item.referee.name if item.referee else '',
                "stadium": item.stadium.name if item.stadium else '',
                "league": item.league.name if item.league else '',
                "home_end_score": item.home_end_score,
                "away_end_score": item.away_end_score,
                "start_time": item.start_time.strftime('%Y-%m-%d %H:%M:%S'),
                "end_time": item.end_time.strftime('%Y-%m-%d %H:%M:%S') if item.end_time else '',
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class MatchDetailListJson(ListJson):

    model = MatchDetail

    # define the columns that will be returned
    order_columns = [
        'minute',
        'match',
        'match_action',
        'player',
        'is_score',
        'is_penalty',
    ]

    def filter_queryset(self, qs):
        return filter_match_detail(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:match_detail_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:match_detail_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "match": str(item.match),
                "match_action": item.action.name if item.action else '',
                "player": item.player.name if item.player else '',
                "is_score": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.is_score is True else '<i class="ion ion-close-circled text-danger"></i>',
                "is_penalty": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.is_penalty is True else '<i class="ion ion-close-circled text-danger"></i>',
                "minute": str(item.minute) + "'",
                "action": mark_safe(action)
            })
        return json_data


class MatchActionListJson(ListJson):
    model = MatchAction

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:match_action_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:match_action_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class CategoryListJson(ListJson):
    model = Category

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:category_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:category_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class PostListJson(ListJson):
    model = Post

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_post(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:post_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:post_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "category": item.category.name if item.category else '',
                "clubs": ', '.join(x.name for x in item.clubs.all()),
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "tags": ', '.join(x.name for x in item.tags.all()),
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "display_place": DISPLAY_CHOICES[item.display_place],
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class BannerListJson(ListJson):
    model = Banner

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_banner(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:banner_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:banner_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "link": item.link,
                "position": item.position.name if item.position else '',
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class BannerPositionListJson(ListJson):
    model = BannerPosition

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:banner_position_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:banner_position_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "position_key": item.position_key,
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "action": mark_safe(action)
            })
        return json_data


class GalleryListJson(ListJson):
    model = Gallery

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:gallery_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:gallery_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "clubs": ', '.join(x.name for x in item.clubs.all()),
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data


class SocialListJson(ListJson):
    model = Social

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:social_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:social_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "social_link": item.social_link,
                "social_type": SOCIAL_CHOICES[item.social_type],
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "clubs": ', '.join(x.name for x in item.clubs.all()),
                "action": mark_safe(action)
            })
        return json_data


class SponsorListJson(ListJson):
    model = Sponsor

    # define the columns that will be returned
    order_columns = [
        'name',
        'updated_at',
    ]

    def filter_queryset(self, qs):
        return filter_normal(qs, self.request)

    def prepare_results(self, qs):
        # prepare list with output column data
        # queryset is already paginated here
        json_data = []
        for item in qs:
            action = '<a class="table-action-btn" title="Chỉnh sửa" href="' + reverse('core:sponsor_edit', kwargs={'item_id': item.id}) + '"><i class="fa fa-pencil text-success"></i></a> <a class="table-action-btn" id="btn-delete-'+str(item.id)+'" title="Remove" data-url="' + reverse('core:sponsor_delete', kwargs={'item_id': item.id}) + '"><i class="fa fa-remove text-danger"></i></a>'

            json_data.append({
                "name": item.name,
                "link": item.link,
                "image": '<img width="100" height="auto" src="'+item.image.url+'" />' if item.image else '',
                "status": '<i class="ion ion-checkmark-circled text-success"></i>'
                if item.status is True else '<i class="ion ion-close-circled text-danger"></i>',
                "updated_at": item.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
                "action": mark_safe(action)
            })
        return json_data
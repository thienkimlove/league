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

from core.forms import SignInViaUsernameForm
from core.helpers import *
from core.models import *
from project import settings


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
            action = '<a class="table-action-btn" ' \
                     'title="Chỉnh sửa Stadium" ' \
                     'href="' + reverse('core:stadium_edit', kwargs={'item_id': item.id}) + '">' \
                     '<i class="fa fa-pencil text-success"></i>' \
                     '</a> '

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
            action = '<a class="table-action-btn" ' \
                     'title="Chỉnh sửa Season" ' \
                     'href="' + reverse('core:season_edit', kwargs={'item_id': item.id}) + '">' \
                     '<i class="fa fa-pencil text-success"></i>' \
                     '</a> '

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

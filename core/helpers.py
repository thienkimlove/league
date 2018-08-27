from django.apps import apps
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.utils.datetime_safe import datetime, time
from django.utils.text import capfirst
from django.utils.timezone import localtime, localdate, make_aware

from core.forms import *


def get_class_by_name(name):
    name = ''.join(capfirst(x) for x in name.split('_'))
    return globals()[name]


def get_model_by_name(name):
    name = ''.join(capfirst(x) for x in name.split('_'))
    return apps.get_model('core', name)


def list_content(request, key):
    if not request.user.is_authenticated:
        return redirect(reverse_lazy('core:login'))
    return render(request, 'core/%s/index.html' % key)


def edit_content(request, key, item_id):
    if not request.user.is_authenticated:
        return redirect(reverse_lazy('core:login'))

    model = get_model_by_name(key)
    form_class = get_class_by_name(key + 'Form')
    content = model.objects.get(pk=item_id)

    if request.method == 'POST':
        form = form_class(request.POST, request.FILES, instance=content)
        if form.is_valid():
            form.save()
            return redirect(reverse_lazy('core:%s_list' % key))
    else:
        form = form_class(instance=content)
    return render(request, 'core/%s/edit.html' % key, {'form': form})


def create_content(request, key):
    if not request.user.is_authenticated:
        return redirect(reverse_lazy('core:login'))

    form_class = get_class_by_name(key + 'Form')
    if request.method == 'POST':
        form = form_class(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect(reverse_lazy('core:%s_list' % key))
    else:
        form = form_class()
    return render(request, 'core/%s/edit.html' % key, {'form': form})


def delete_content(request, key, item_id):
    model = get_model_by_name(key)
    model.objects.get(pk=item_id).delete()
    return JsonResponse({'status': 'ok'})


def filter_normal(qs, request):
    # simple example:
    search_name = request.GET.get(u'name', None)
    if search_name:
        qs = qs.filter(name__icontains=search_name)

    filter_status = request.GET.get('status', None)
    if filter_status:
        filter_status = True if filter_status == '1' else False
        qs = qs.filter(status=filter_status)

    return qs


def filter_player(qs, request):
    # simple example:
    qs = filter_normal(qs, request)

    filter_club = request.GET.get('club', None)
    if filter_club:
        filter_club = int(filter_club)
        qs = qs.filter(club=filter_club)

    return qs


def filter_player_history(qs, request):
    # simple example:

    filter_club = request.GET.get('club', None)
    if filter_club:
        filter_club = int(filter_club)
        qs = qs.filter(club=filter_club)
    filter_player = request.GET.get('player', None)
    if filter_player:
        filter_player = int(filter_player)
        qs = qs.filter(player=filter_player)

    return qs


def filter_coach_history(qs, request):
    # simple example:

    filter_club = request.GET.get('club', None)
    if filter_club:
        filter_club = int(filter_club)
        qs = qs.filter(club=filter_club)
    filter_coach = request.GET.get('coach', None)
    if filter_coach:
        filter_coach = int(filter_coach)
        qs = qs.filter(coach=filter_coach)

    return qs


def filter_match(qs, request):
    # simple example:

    qs = qs.order_by("-start_time")

    filter_club = request.GET.get('club', None)
    if filter_club:
        filter_club = int(filter_club)
        qs = qs.filter(Q(home_team=filter_club) | Q(away_team=filter_club))

    filter_season = request.GET.get('season', None)
    if filter_season:
        filter_season = int(filter_season)
        qs = qs.filter(league__season=filter_season)

    filter_date = request.GET.get('date', None)

    if filter_date:
        temp_date = filter_date.split(" - ")
        start_date = datetime.strptime(temp_date[0] + " 00:00:00", "%d/%m/%Y %H:%M:%S")
        end_date = datetime.strptime(temp_date[1] + " 23:59:59", "%d/%m/%Y %H:%M:%S")
        qs = qs.filter(start_time__gte=start_date).filter(start_time__lte=end_date)

    return qs


def filter_match_detail(qs, request):
    # simple example:

    filter_club = request.GET.get('club', None)
    if filter_club:
        filter_club = int(filter_club)
        qs = qs.filter(Q(match__home_team=filter_club) | Q(match__away_team=filter_club))

    filter_match = request.GET.get('match', None)
    if filter_match:
        filter_match = int(filter_match)
        qs = qs.filter(match=filter_match)

    filter_player = request.GET.get('player', None)
    if filter_player:
        filter_player = int(filter_player)
        qs = qs.filter(player=filter_player)

    return qs


def filter_post(qs, request):
    # simple example:
    qs = filter_normal(qs, request)

    filter_category = request.GET.get('category', None)
    if filter_category:
        filter_category = int(filter_category)
        qs = qs.filter(category=filter_category)

    filter_club = request.GET.get('club', None)
    if filter_club:
        filter_club = int(filter_club)
        qs = qs.filter(clubs__in=[filter_club])

    return qs


def filter_banner(qs, request):
    # simple example:
    qs = filter_normal(qs, request)

    filter_position = request.GET.get('position', None)
    if filter_position:
        filter_position = int(filter_position)
        qs = qs.filter(position=filter_position)

    return qs


def display_time(time, format="%a, %d %b %Y %H:%M"):
    return localtime(time).strftime(format)


def display_date(date, format='%Y-%m-%d'):
    return display_time(make_aware(datetime.combine(date, time())), format)


def get_current_season():
    today = now().date()
    season = Season.objects.filter(Q(start_date__lt=today) & Q(end_date__gt=today))
    if season:
        return season.first()
    return


def get_match_for_current_season():
    current_season = get_current_season()
    matches = Match.objects.filter(league__season=current_season).filter(status=True)
    for match in matches:
        match.name = match.get_name()
    return matches
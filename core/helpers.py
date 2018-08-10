from django.apps import apps
from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.utils.text import capfirst
from core.forms import *


def get_class_by_name(name):
    return globals()[capfirst(name)]


def get_model_by_name(name):
    return apps.get_model('core', capfirst(name))


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

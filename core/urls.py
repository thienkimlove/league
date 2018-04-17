from dal import autocomplete
from django.conf.urls import url
from taggit.models import Tag

from core.views import *

app_name = "core"

class TagAutoComplete(autocomplete.Select2QuerySetView):
    def get_queryset(self):
        qs = Tag.objects.all()
        if self.q:
            qs = qs.filter(name__istartswith=self.q)

        return qs


urlpatterns = [
    url(r'^tag-autocomplete/$', TagAutoComplete.as_view(), name='tag_autocomplete'),
    url(r'^players$', player_by_club_json, name='player_by_club'),
]
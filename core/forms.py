from ckeditor_uploader.widgets import CKEditorUploadingWidget
from dal import autocomplete

from django import forms
from django.db.models import Q
from django.forms import SelectDateWidget

from core.models import *
from project import settings


class PostForm(autocomplete.FutureModelForm):
    class Meta:
        model = Post
        fields = '__all__'
        widgets = {
            'content': CKEditorUploadingWidget(),
            'tags': autocomplete.TaggitSelect2(url='core:tag_autocomplete'),
        }
        labels = settings.LABELS


class PlayerForm(forms.ModelForm):
    class Meta:
        model = Player
        fields = '__all__'
        widgets = {
            'dob': SelectDateWidget(years=[x for x in range(1979, 2005)]),
        }
        labels = settings.LABELS

class CoachForm(forms.ModelForm):
    class Meta:
        model = Coach
        fields = '__all__'
        widgets = {
            'dob': SelectDateWidget(years=[x for x in range(1979, 2005)]),
        }
        labels = settings.LABELS

class RefereeForm(forms.ModelForm):
    class Meta:
        model = Referee
        fields = '__all__'
        widgets = {
            'dob': SelectDateWidget(years=[x for x in range(1979, 2005)]),
        }
        labels = settings.LABELS

class MatchForm(forms.ModelForm):
    class Meta:
        model = Match
        fields = '__all__'
        widgets = {

        }
        labels = settings.LABELS

    class Media:
        pass
        #js = ('core/js/ajax.js',)

class MatchDetailForm(forms.ModelForm):

    class Meta:
        model = MatchDetail
        fields = '__all__'
        labels = settings.LABELS

    def __init__(self, *args, **kwargs):
        super(MatchDetailForm, self).__init__(*args, **kwargs)
        if self.instance.match_id:
            q = Q(status=True) | Q(club_id__isin=(self.instance.match.home_team_id, self.instance.match.away_team_id))
            self.fields['player'].queryset = Player.objects.filter(q)
        else:
            self.fields['player'].queryset = Player.objects.filter(status=True)
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from dal import autocomplete

from django import forms
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

class MembershipForm(forms.ModelForm):
    class Meta:
        model = Membership
        fields = '__all__'
        widgets = {
            'date_joined': SelectDateWidget(years=[x for x in range(2010, 2030)]),
            'date_quited': SelectDateWidget(empty_label=("Choose Year", "Choose Month", "Choose Day"), years=[x for x in range(2010, 2030)]),
        }
        labels = settings.LABELS
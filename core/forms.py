from ckeditor_uploader.widgets import CKEditorUploadingWidget
from dal import autocomplete

from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.db.models import Q
from django.forms import SelectDateWidget, ModelForm
from django.utils.translation import gettext_lazy as _
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


class GalleryForm(autocomplete.FutureModelForm):
    class Meta:
        model = Gallery
        fields = '__all__'
        widgets = {
            'content': CKEditorUploadingWidget(),
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
            'dob': SelectDateWidget(years=[x for x in range(1930, 2005)]),
        }
        labels = settings.LABELS


class RefereeForm(forms.ModelForm):
    class Meta:
        model = Referee
        fields = '__all__'
        widgets = {
            'dob': SelectDateWidget(years=[x for x in range(1930, 2005)]),
        }
        labels = settings.LABELS


class MatchForm(forms.ModelForm):
    class Meta:
        model = Match
        fields = '__all__'
        widgets = {

        }
        labels = settings.LABELS


class MatchDetailForm(forms.ModelForm):
    class Meta:
        model = MatchDetail
        fields = '__all__'
        labels = settings.LABELS


class UserCacheMixin:
    user_cache = None


class SignIn(UserCacheMixin, forms.Form):
    password = forms.CharField(label=_('Password'), strip=False, widget=forms.PasswordInput)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        if settings.USE_REMEMBER_ME:
            self.fields['remember_me'] = forms.BooleanField(label=_('Remember me'), required=False)

    def clean_password(self):
        password = self.cleaned_data['password']

        if not self.user_cache:
            return password

        if not self.user_cache.check_password(password):
            raise ValidationError(_('You entered an invalid password.'))

        return password


class SignInViaUsernameForm(SignIn):
    username = forms.CharField(label=_('Username'))

    @property
    def field_order(self):
        if settings.USE_REMEMBER_ME:
            return ['username', 'password', 'remember_me']
        return ['username', 'password']

    def clean_username(self):
        username = self.cleaned_data['username']

        user = User.objects.filter(username=username).first()
        if not user:
            raise ValidationError(_('You entered an invalid username.'))

        if not user.is_active:
            raise ValidationError(_('This account is not active.'))

        self.user_cache = user

        return username


class StadiumForm(ModelForm):
    class Meta:
        model = Stadium
        fields = ('name', 'capable', 'image', 'status')


class SeasonForm(ModelForm):
    class Meta:
        model = Season
        fields = ('name', 'start_date', 'end_date', 'status')


class PositionForm(ModelForm):
    class Meta:
        model = Position
        fields = ('name', 'is_goal_keeper', 'status')


class LeagueForm(ModelForm):
    class Meta:
        model = League
        fields = ('name', 'season', 'status')


class ClubForm(ModelForm):
    class Meta:
        model = Club
        fields = '__all__'


class MatchActionForm(ModelForm):
    class Meta:
        model = MatchAction
        fields = '__all__'


class CategoryForm(ModelForm):
    class Meta:
        model = Category
        fields = '__all__'


class BannerForm(ModelForm):
    class Meta:
        model = Banner
        fields = '__all__'


class BannerPositionForm(ModelForm):
    class Meta:
        model = BannerPosition
        fields = '__all__'


class SponsorForm(ModelForm):
    class Meta:
        model = Sponsor
        fields = '__all__'


class SocialForm(ModelForm):
    class Meta:
        model = Social
        fields = '__all__'
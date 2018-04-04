from ckeditor_uploader.widgets import CKEditorUploadingWidget
from dal import autocomplete

from django import forms
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

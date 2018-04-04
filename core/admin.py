from django.contrib import admin

# Register your models here.
from django.contrib.admin.models import LogEntry
from import_export.admin import ExportMixin
from import_export.formats import base_formats

from core.entry import LogEntryAdmin
from core.forms import *
from core.resources import PostResource

admin.site.register(LogEntry, LogEntryAdmin)

class GeneralWithTagAdmin(admin.ModelAdmin):
    search_fields = ['name', ]
    list_filter = (
        'status',
    )

    def get_queryset(self, request):
        return super(GeneralWithTagAdmin, self).get_queryset(request).prefetch_related('tags')

    def tag_list(self, obj):
        return u", ".join(o.name for o in obj.tags.all())


class PostAdmin(ExportMixin, GeneralWithTagAdmin):
    list_display = ('name', 'image_tag', 'views', 'tag_list', 'created_at', 'status')

    form = PostForm
    resource_class = PostResource
    to_encoding = "utf8mb4"
    formats = [
        base_formats.XLS,
    ]

admin.site.register(Post, PostAdmin)

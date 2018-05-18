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

class PlayerAdmin(admin.ModelAdmin):
    search_fields = ['name', ]
    list_filter = (
        'status',
    )
    list_display = ('name', 'club', 'dob', 'nationality', 'height', 'weight', 'position', 'created_at', 'status')
    form = PlayerForm

class CoachAdmin(admin.ModelAdmin):
    search_fields = ['name', ]
    list_filter = (
        'status',
    )
    list_display = ('name', 'club', 'dob', 'nationality', 'height', 'weight', 'created_at', 'status')
    form = CoachForm

class RefereeAdmin(admin.ModelAdmin):
    search_fields = ['name', ]
    list_filter = (
        'status',
    )
    list_display = ('name', 'dob', 'nationality', 'height', 'weight', 'created_at', 'status')
    form = RefereeForm




class GeneralAdmin(admin.ModelAdmin):
    pass

class MatchDetailInline(admin.TabularInline):
    model = MatchDetail

class MatchAdmin(admin.ModelAdmin):
    #autocomplete_fields = ['start_player_home_team', 'start_player_away_team']
    inlines = [
        MatchDetailInline,
    ]
    form = MatchForm
    class Media:
        js = (
            'core/js/bind_fields.js',   # app static folder
        )

admin.site.register(Player, PlayerAdmin)
admin.site.register(Club, GeneralAdmin)
admin.site.register(Stadium, GeneralAdmin)
admin.site.register(Referee, RefereeAdmin)
admin.site.register(Match, MatchAdmin)
admin.site.register(Coach, CoachAdmin)
admin.site.register(League, GeneralAdmin)
admin.site.register(Season, GeneralAdmin)
admin.site.register(Position, GeneralAdmin)
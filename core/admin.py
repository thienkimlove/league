from constance.admin import ConstanceAdmin
from django.contrib import admin

# Register your models here.
from django.contrib.admin.models import LogEntry
from import_export.admin import ExportMixin
from import_export.formats import base_formats
from taggit.admin import TagAdmin

from core.entry import LogEntryAdmin
from core.forms import *
from core.resources import PostResource


class GeneralAdmin(admin.ModelAdmin):
    menu_group = "General"
    pass


class GeneralWithTagAdmin(admin.ModelAdmin):
    search_fields = ['name', ]
    list_filter = (
        'status',
    )

    def get_queryset(self, request):
        return super(GeneralWithTagAdmin, self).get_queryset(request).prefetch_related('tags')

    def tag_list(self, obj):
        return u", ".join(o.name for o in obj.tags.all())


class BannerAdmin(GeneralAdmin):
    menu_title = "Banners"
    menu_group = "Media"


class BannerPositionAdmin(GeneralAdmin):
    menu_title = "Banner Positions"
    menu_group = "Media"


class GalleryAdmin(GeneralAdmin):
    menu_title = "Galleries"
    menu_group = "News"
    form = GalleryForm


class PostAdmin(ExportMixin, GeneralWithTagAdmin):
    menu_title = "Posts"
    menu_group = "News"
    list_display = ('name', 'image_tag', 'views', 'tag_list', 'display_place', 'club_list', 'created_at', 'status')

    form = PostForm
    resource_class = PostResource
    to_encoding = "utf8mb4"
    formats = [
        base_formats.XLS,
    ]


class PlayerAdmin(admin.ModelAdmin):
    menu_title = "Players"
    menu_group = "General"
    search_fields = ['name', ]
    list_filter = (
        'status',
    )
    list_display = ('name', 'club', 'dob', 'nationality', 'height', 'weight', 'position', 'created_at', 'status')
    form = PlayerForm


class CoachAdmin(admin.ModelAdmin):
    menu_title = "Managers"
    menu_group = "General"
    search_fields = ['name', ]
    list_filter = (
        'status',
    )
    list_display = ('name', 'club', 'dob', 'nationality', 'height', 'weight', 'created_at', 'status')
    form = CoachForm


class RefereeAdmin(admin.ModelAdmin):
    menu_title = "Referee"
    menu_group = "General"
    search_fields = ['name', ]
    list_filter = (
        'status',
    )
    list_display = ('name', 'dob', 'nationality', 'height', 'weight', 'created_at', 'status')
    form = RefereeForm


class MatchDetailInline(admin.TabularInline):
    model = MatchDetail


class PositionAdmin(GeneralAdmin):
    menu_title = "Positions"
    menu_group = "Matches"


class MatchAdmin(admin.ModelAdmin):
    menu_title = "Matches"
    menu_group = "Matches"

    # autocomplete_fields = ['start_home_team', 'start_away_team']
    inlines = [
        MatchDetailInline,
    ]
    form = MatchForm

    class Media:
        js = (
            'core/js/bind_fields.js',  # app static folder
        )


admin.site.register(Post, PostAdmin)
admin.site.register(Player, PlayerAdmin)
admin.site.register(Club, GeneralAdmin)
admin.site.register(Stadium, GeneralAdmin)
admin.site.register(Referee, RefereeAdmin)
admin.site.register(Match, MatchAdmin)
admin.site.register(Coach, CoachAdmin)
admin.site.register(League, GeneralAdmin)
admin.site.register(Season, GeneralAdmin)
admin.site.register(Position, PositionAdmin)
admin.site.register(Banner, BannerAdmin)
admin.site.register(Gallery, GalleryAdmin)
admin.site.register(Social, GeneralAdmin)
admin.site.register(Category, GeneralAdmin)
admin.site.register(BannerPosition, BannerPositionAdmin)
admin.site.register(Sponsor, GeneralAdmin)
admin.site.register(MatchAction, GeneralAdmin)
admin.site.register(LogEntry, LogEntryAdmin)

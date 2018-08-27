from django.db import models
from django.db.models.signals import post_save

from django.utils.safestring import mark_safe
from django.utils.text import slugify
from django.utils.timezone import now
from django.utils.translation import gettext_lazy as _
from django_countries.fields import CountryField
from smart_selects.db_fields import ChainedForeignKey, ChainedManyToManyField
from taggit.managers import TaggableManager

DEFAULT_COUNTRY = 'VN'


class GeneralCharField(models.CharField):
    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = 191
        super().__init__(*args, **kwargs)


def site_slug(data):
    vietnamese_map = {
        ord(u'o'): 'o', ord(u'ò'): 'o', ord(u'ó'): 'o', ord(u'ỏ'): 'o', ord(u'õ'): 'o', ord(u'ọ'): 'o',
        ord(u'ơ'): 'o', ord(u'ờ'): 'o', ord(u'ớ'): 'o', ord(u'ở'): 'o', ord(u'ỡ'): 'o', ord(u'ợ'): 'o',
        ord(u'ô'): 'o', ord(u'ồ'): 'o', ord(u'ố'): 'o', ord(u'ổ'): 'o', ord(u'ỗ'): 'o', ord(u'ộ'): 'o',

        ord(u'à'): 'a', ord(u'á'): 'a', ord(u'á'): 'a', ord(u'ả'): 'a', ord(u'ã'): 'a', ord(u'ạ'): 'a',
        ord(u'ă'): 'a', ord(u'ắ'): 'a', ord(u'ằ'): 'a', ord(u'ẳ'): 'a', ord(u'ẵ'): 'a', ord(u'ạ'): 'a',
        ord(u'â'): 'a', ord(u'ầ'): 'a', ord(u'ấ'): 'a', ord(u'ậ'): 'a', ord(u'ẫ'): 'a', ord(u'ẩ'): 'a',

        ord(u'đ'): 'd', ord(u'Đ'): 'd',

        ord(u'è'): 'e', ord(u'é'): 'e', ord(u'ẻ'): 'e', ord(u'ẽ'): 'e', ord(u'ẹ'): 'e',
        ord(u'ê'): 'e', ord(u'ề'): 'e', ord(u'ế'): 'e', ord(u'ể'): 'e', ord(u'ễ'): 'e', ord(u'ệ'): 'e',

        ord(u'ì'): 'i', ord(u'í'): 'i', ord(u'ỉ'): 'i', ord(u'ĩ'): 'i', ord(u'ị'): 'i',
        ord(u'ư'): 'u', ord(u'ừ'): 'u', ord(u'ứ'): 'u', ord(u'ử'): 'ữ', ord(u'ữ'): 'u', ord(u'ự'): 'u',
        ord(u'ý'): 'y', ord(u'ỳ'): 'y', ord(u'ỷ'): 'y', ord(u'ỹ'): 'y', ord(u'ỵ'): 'y',
    }
    data = (data[:200]) if len(data) > 200 else data
    return slugify(data.translate(vietnamese_map), allow_unicode=True)


class GeneralSlug(models.SlugField):
    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = 191
        kwargs['blank'] = True
        kwargs['null'] = True
        kwargs['editable'] = False
        kwargs['db_index'] = True
        kwargs['allow_unicode'] = True
        super().__init__(*args, **kwargs)


class SiteSlug(models.Model):
    slug = GeneralCharField()
    content = GeneralCharField()

    class Meta:
        unique_together = ('slug', 'content',)


class TimeStampedModel(models.Model):
    """
    An abstract base class model that provides self-updating
    ``created`` and ``modified`` fields.
    """
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True
        ordering = ["-updated_at"]

    def class_name(self):
        return self.__class__.__name__

    def _get_unique_slug(self):
        if hasattr(self, 'slug') and hasattr(self, 'name'):
            slug = site_slug(self.name)
            unique_slug = slug
            num = 1
            model_name = self.class_name()
            while SiteSlug.objects.filter(slug=unique_slug).filter(content=model_name).exists():
                unique_slug = '{}-{}'.format(slug, num)
                num += 1
            SiteSlug.objects.create(slug=unique_slug, content=model_name)
            return unique_slug

    def save(self, *args, **kwargs):
        if hasattr(self, 'slug'):
            self.slug = self._get_unique_slug()
        super().save()

    def __str__(self):
        if hasattr(self, 'name'):
            return "{0}".format(self.name)
        return ''

    def get_absolute_url(self):
        if hasattr(self, 'slug'):
            return '/%s.html' % self.slug
        return ''

    def image_tag(self):
        if hasattr(self, 'image') and self.image:
            return mark_safe('<img src="%s" width="150" />' % self.image.url)
        return None

    image_tag.short_description = _('Image')


class Stadium(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    capable = models.PositiveIntegerField(null=True, default=None, blank=True)
    image = models.ImageField(null=True, default=None, blank=True)
    status = models.BooleanField(default=True)

    class Meta:
        verbose_name = _('Stadium')
        verbose_name_plural = _('Stadiums')


class Season(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    start_date = models.DateField(null=True, default=None, blank=True)
    end_date = models.DateField(null=True, default=None, blank=True)
    status = models.BooleanField(default=True)

    class Meta:
        verbose_name = _('Season')
        verbose_name_plural = _('Seasons')


class Position(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    status = models.BooleanField(default=True)
    is_goal_keeper = models.BooleanField(default=False)

    class Meta:
        verbose_name = _('Position')
        verbose_name_plural = _('Positions')


class League(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    slug = GeneralSlug()
    season = models.ForeignKey(Season, on_delete=models.CASCADE, null=True, default=None, blank=True)
    status = models.BooleanField(default=True)

    class Meta:
        verbose_name = _('League')
        verbose_name_plural = _('Leagues')


class Club(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    short_name = GeneralCharField(null=True, default=None, blank=True)
    website = GeneralCharField(null=True, default=None, blank=True)
    slug = GeneralSlug()
    image = models.ImageField(null=True, default=None, blank=True)
    stadium = models.ForeignKey(Stadium, on_delete=models.CASCADE, blank=True, null=True, default=None)
    background_img = models.ImageField(null=True, default=None, blank=True)
    status = models.BooleanField(default=True)

    class Meta:
        verbose_name = _('Club')
        verbose_name_plural = _('Clubs')


class Player(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    slug = GeneralSlug()
    dob = models.DateField(null=True, default=None, blank=True)
    nationality = CountryField(null=True, default=DEFAULT_COUNTRY, blank=True)
    height = models.PositiveSmallIntegerField(null=True, default=None, blank=True)
    weight = models.PositiveSmallIntegerField(null=True, default=None, blank=True)
    position = models.ForeignKey(Position, on_delete=models.CASCADE, null=True, default=None, blank=True)
    club = models.ForeignKey(Club, on_delete=models.CASCADE, blank=True, null=True, default=None)
    club_number = models.SmallIntegerField(default=0, null=True, blank=True)
    image = models.ImageField(null=True, default=None, blank=True)
    status = models.BooleanField(default=True)

    class Meta:
        verbose_name = _('Player')
        verbose_name_plural = _('Players')


class PlayerHistory(TimeStampedModel):
    player = models.ForeignKey(Player, on_delete=models.CASCADE)
    club = models.ForeignKey(Club, on_delete=models.CASCADE)
    date = models.DateField(null=True, default=None, blank=True)

    class Meta:
        unique_together = ('player', 'club', 'date')


class Referee(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    dob = models.DateField(null=True, default=None, blank=True)
    nationality = CountryField(null=True, default=DEFAULT_COUNTRY, blank=True)
    height = models.PositiveSmallIntegerField(null=True, default=None, blank=True)
    weight = models.PositiveSmallIntegerField(null=True, default=None, blank=True)
    image = models.ImageField(null=True, default=None, blank=True)
    status = models.BooleanField(default=True)

    class Meta:
        verbose_name = _('Referee')
        verbose_name_plural = _('Referees')


class Coach(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    dob = models.DateField(null=True, default=None, blank=True)
    nationality = CountryField(null=True, default=DEFAULT_COUNTRY, blank=True)
    height = models.PositiveSmallIntegerField(null=True, default=None, blank=True)
    weight = models.PositiveSmallIntegerField(null=True, default=None, blank=True)
    image = models.ImageField(null=True, default=None, blank=True)
    status = models.BooleanField(default=True)
    club = models.ForeignKey(Club, on_delete=models.CASCADE, blank=True, null=True, default=None)

    class Meta:
        verbose_name = _('Coach')
        verbose_name_plural = _('Coaches')


class CoachHistory(TimeStampedModel):
    coach = models.ForeignKey(Coach, on_delete=models.CASCADE)
    club = models.ForeignKey(Club, on_delete=models.CASCADE)
    date = models.DateField(null=True, default=None, blank=True)

    class Meta:
        unique_together = ('coach', 'club', 'date')


class Match(TimeStampedModel):
    home_team = models.ForeignKey(Club, related_name='home_matches', on_delete=models.CASCADE, null=True, default=None)
    away_team = models.ForeignKey(Club, related_name='away_matches', on_delete=models.CASCADE, null=True, default=None)

    start_home_team = ChainedManyToManyField(
        Player,
        chained_field="home_team",
        chained_model_field="club",
        related_name='start_home_team')

    start_away_team = ChainedManyToManyField(
        Player,
        chained_field="away_team",
        chained_model_field="club",
        related_name='start_away_team')

    referee = models.ForeignKey(Referee, on_delete=models.CASCADE)
    start_time = models.DateTimeField(null=True)
    stadium = models.ForeignKey(Stadium, on_delete=models.CASCADE)
    league = models.ForeignKey(League, on_delete=models.CASCADE)
    home_end_score = models.SmallIntegerField(default=0)
    away_end_score = models.SmallIntegerField(default=0)
    status = models.BooleanField(default=True)
    is_end = models.BooleanField(default=False, verbose_name='Finish', name='is_end')
    man_of_match = models.ForeignKey(Player, on_delete=models.CASCADE, blank=True, null=True)
    man_of_match_score = models.FloatField(default=0.0, blank=True, null=True)
    attend_number = models.IntegerField(default=0, blank=True, null=True)

    class Meta:
        verbose_name = _('Match')
        verbose_name_plural = _('Matches')

    def __str__(self):
        return "{0} VS {1} ({2} - {3})".format(self.home_team.name, self.away_team.name, self.home_end_score,
                                               self.away_end_score)

    def get_name(self):
        return self.__str__


class MatchAction(TimeStampedModel):
    name = GeneralCharField(null=True, default=None, unique=True)
    image = models.ImageField(blank=True, null=True)
    status = models.BooleanField(default=True)


class MatchDetail(TimeStampedModel):

    MATCH_PARTS = (
        ('first_half', _("First Half")),
        ('second_half', _("Second Half")),
        ('hiep_phu1', _("Hiệp phụ 1")),
        ('hiep_phu2', _("Hiệp phụ 2")),
        ('penalty_time', _("Đá Penalty")),

    )

    match = models.ForeignKey(Match, on_delete=models.CASCADE)
    action = models.ForeignKey(MatchAction, on_delete=models.CASCADE, blank=True, null=True)
    is_home_score = models.BooleanField(default=False)
    is_away_score = models.BooleanField(default=False)
    player = models.ForeignKey(Player, on_delete=models.CASCADE, null=True, default=None, blank=True)
    minute = models.SmallIntegerField(null=True, blank=True)
    more_detail = models.CharField(max_length=255, blank=True, null=True)
    in_match_part = GeneralCharField(choices=MATCH_PARTS, blank=True, null=True)


class Category(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    desc = models.TextField(blank=True, null=True)
    slug = GeneralSlug()
    status = models.BooleanField(default=True)


class Post(TimeStampedModel):
    DISPLAY_CHOICES = (
        ('block_1', _("Vị trí trung tâm trang chủ")),
        ('block_2', _("Block 2 trang chủ")),

    )

    name = GeneralCharField(null=True, default=None)
    desc = models.TextField(blank=True, null=True)
    slug = GeneralSlug()
    status = models.BooleanField(default=True)
    image = models.ImageField(blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    tags = TaggableManager()
    views = models.IntegerField(default=0, editable=False)
    display_place = GeneralCharField(choices=DISPLAY_CHOICES, blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, default=None, null=True)
    display_time = models.DateTimeField(null=True)
    clubs = models.ManyToManyField(Club, blank=True)

    class Meta:
        verbose_name = _('Post')
        verbose_name_plural = _('Posts')

    def club_list(self):
        if hasattr(self, 'clubs'):
            return ', '.join(s.name for s in self.clubs.all())
        return None

    club_list.short_description = _('Clubs')


class BannerPosition(TimeStampedModel):
    name = GeneralCharField()
    position_key = GeneralCharField()
    status = models.BooleanField(default=True)


class Banner(TimeStampedModel):
    name = GeneralCharField()
    link = GeneralCharField(blank=True, null=True)
    position = models.ForeignKey(BannerPosition, on_delete=models.CASCADE, null=True, default=None)
    image = models.ImageField(null=True, default=None, blank=True)
    status = models.BooleanField(default=True)

    class Meta:
        verbose_name = _('Banner')
        verbose_name_plural = _('Banners')


class Gallery(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    slug = GeneralSlug()
    content = models.TextField(blank=True, null=True)
    status = models.BooleanField(default=True)
    image = models.ImageField(blank=True, null=True)
    clubs = models.ManyToManyField(Club, blank=True)

    class Meta:
        verbose_name = _('Gallery')
        verbose_name_plural = _('Galleries')

    def club_list(self):
        if hasattr(self, 'clubs'):
            return ', '.join(s.name for s in self.clubs.all())
        return None

    club_list.short_description = _('Clubs')


class Sponsor(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    link = GeneralCharField(null=True, default=None, blank=True)
    slug = GeneralSlug()
    status = models.BooleanField(default=True)
    image = models.ImageField(blank=True, null=True)

    class Meta:
        verbose_name = _('Sponsor')
        verbose_name_plural = _('Sponsors')


class Social(TimeStampedModel):
    SOCIAL_CHOICES = (
        ('facebook', _("Facebook")),
        ('google', _("Google")),
        ('twitter', _("Twitter")),

    )

    name = GeneralCharField(null=True, default=None)
    status = models.BooleanField(default=True)
    image = models.ImageField(blank=True, null=True)
    social_type = GeneralCharField(choices=SOCIAL_CHOICES, blank=True, null=True)
    social_link = GeneralCharField(blank=True, null=True)
    clubs = models.ManyToManyField(Club, blank=True)

    class Meta:
        verbose_name = _('Social')
        verbose_name_plural = _('Socials')

    def club_list(self):
        if hasattr(self, 'clubs'):
            return ', '.join(s.name for s in self.clubs.all())
        return None

    club_list.short_description = _('Clubs')


# Signals

def save_or_create_player_history(sender, instance, created, **kwargs):
    PlayerHistory.objects.get_or_create(player=instance, club_id=instance.club_id, date=now().strftime('%Y-%m-%d'))


post_save.connect(save_or_create_player_history, sender=Player)


def save_or_create_coach_history(sender, instance, created, **kwargs):
    CoachHistory.objects.get_or_create(coach=instance, club_id=instance.club_id, date=now().strftime('%Y-%m-%d'))


post_save.connect(save_or_create_coach_history, sender=Coach)

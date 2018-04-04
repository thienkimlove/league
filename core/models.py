from django.db import models

# Create your models here.

from django.utils.safestring import mark_safe
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from taggit.managers import TaggableManager


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
    slug = slugify(data.translate(vietnamese_map))
    return slug

class GeneralSlug(GeneralCharField):
    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = 191
        kwargs['blank'] = True
        kwargs['null'] = True
        kwargs['editable'] = False
        kwargs['db_index'] = True
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
        ordering = ["-created_at"]

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
            if not self.slug:
                self.slug = self._get_unique_slug()
        super().save()


    def __str__(self):
        if hasattr(self, 'name'):
            return "{0}".format(self.name)

    def get_absolute_url(self):
        if hasattr(self, 'slug'):
            return '/%s.html' % self.slug
        return ''

    def image_tag(self):
        if hasattr(self, 'image') and self.image:
            return mark_safe('<img src="%s" width="150" />' % self.image.url)
        return None
    image_tag.short_description = _('Image')

class Player(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    slug = GeneralSlug()
    dob = GeneralCharField(null=True, default=None)
    nationality = GeneralCharField(null=True, default=None)
    height = models.PositiveSmallIntegerField(null=True, default=None)
    weight = models.PositiveSmallIntegerField(null=True, default=None)
    image = models.ImageField(null=True, default=None)
    class Meta:
        verbose_name = _('Player')
        verbose_name_plural = _('Players')

class Coach(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    dob = models.DateField(null=True, default=None)
    nationality = GeneralCharField(null=True, default=None)
    height = models.PositiveSmallIntegerField(null=True, default=None)
    weight = models.PositiveSmallIntegerField(null=True, default=None)
    image = models.ImageField(null=True, default=None)
    class Meta:
        verbose_name = _('Coach')
        verbose_name_plural = _('Coaches')

class Referee(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    dob = models.DateField(null=True, default=None)
    nationality = GeneralCharField(null=True, default=None)
    height = models.PositiveSmallIntegerField(null=True, default=None)
    weight = models.PositiveSmallIntegerField(null=True, default=None)
    image = models.ImageField(null=True, default=None)
    class Meta:
        verbose_name = _('Referee')
        verbose_name_plural = _('Referees')

class Club(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    slug = GeneralSlug()
    image = models.ImageField(null=True, default=None)
    players = models.ManyToManyField(Player, through='Membership')
    class Meta:
        verbose_name = _('Club')
        verbose_name_plural = _('Clubs')


# many-to-many with extra fields
class Membership(TimeStampedModel):
    TYPE_CHOICES = (
        ('goal_keeper', _("Goal Keeper")),
        ('forward', _("Forward")),
        ('defender', _("Defender")),
        ('winger', _("Winger")),
        ('middle_defender', _("Middle Defender")),
        ('middle_attacker', _("Middle Attacker")),
    )
    player = models.ForeignKey(Player, on_delete=models.CASCADE)
    club = models.ForeignKey(Club, on_delete=models.CASCADE)
    date_joined = GeneralCharField()
    date_quited = GeneralCharField(null=True, default=None)
    type = GeneralCharField(choices=TYPE_CHOICES)

class Stadium(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    capable = models.PositiveIntegerField(null=True, default=None)
    image = models.ImageField(null=True, default=None)
    class Meta:
        verbose_name = _('Stadium')
        verbose_name_plural = _('Stadiums')

class League(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)
    slug = GeneralSlug()

    class Meta:
        verbose_name = _('League')
        verbose_name_plural = _('Leagues')

class Season(TimeStampedModel):
    name = GeneralCharField(null=True, default=None)

    class Meta:
        verbose_name = _('Season')
        verbose_name_plural = _('Seasons')

class Match(TimeStampedModel):
    club1 = models.ForeignKey(Club, on_delete=models.CASCADE, related_name='club_1')
    club2 = models.ForeignKey(Club, on_delete=models.CASCADE, related_name='club_2')
    referee = models.ForeignKey(Referee, on_delete=models.CASCADE)
    start_time = GeneralCharField(null=True, default=None)
    end_time = GeneralCharField(null=True, default=None)
    stadium = models.ForeignKey(Stadium, on_delete=models.CASCADE)
    league = models.ForeignKey(League, on_delete=models.CASCADE)
    season = models.ForeignKey(Season, on_delete=models.CASCADE)
    club1_end_score = models.PositiveSmallIntegerField(default=0)
    club2_end_score = models.PositiveSmallIntegerField(default=0)

    class Meta:
        verbose_name = _('Match')
        verbose_name_plural = _('Matches')

class MatchDetail(TimeStampedModel):
    ACTION_CHOICES = (
        ('in', _("In/Start")),
        ('out', _("Out")),
        ('score', _("Score")),
        ('free_kick_corner', _("Free kick corner penalty")),
        ('free_kick_penalty', _("Free kick penalty")),
        ('yellow_card', _("Yellow Card")),
        ('red_card', _("Red Card")),
    )
    match = models.ForeignKey(Match, on_delete=models.CASCADE)
    action = GeneralCharField(choices=ACTION_CHOICES)
    player = models.ForeignKey(Player, on_delete=models.CASCADE)
    time = GeneralCharField(null=True, default=None)



class Post(TimeStampedModel):

    name = GeneralCharField(null=True, default=None)
    desc = models.TextField(blank=True, null=True)
    slug = GeneralSlug()
    status = models.BooleanField(default=True)
    image = models.ImageField(blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    tags = TaggableManager()
    views = models.IntegerField(default=0, editable=False)

    class Meta:
        verbose_name = _('Post')
        verbose_name_plural = _('Posts')



from django.db import models

# Create your models here.

from django.utils.safestring import mark_safe
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _


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

class GeneralSlug(models.CharField):
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

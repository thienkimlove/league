import re
from random import randint
from urllib.parse import parse_qs

from django import template
from django.conf import settings

register = template.Library()
numeric_test = re.compile("^\d+$")

@register.filter
def getattribute(value, arg):
    """Gets an attribute of an object dynamically from a string name"""

    if hasattr(value, str(arg)):
        return getattr(value, arg)
    elif hasattr(value, 'has_key') and value.has_key(arg):
        return value[arg]
    elif numeric_test.match(str(arg)) and len(value) > int(arg):
        return value[int(arg)]
    else:
        return settings.TEMPLATE_STRING_IF_INVALID

@register.filter
def youtube(value, args):
    """
     returns youtube thumb url
    args s, l (small, large)

    """
    qs = value.split('?')
    video_id = parse_qs(qs[1])['v'][0]

    if args == 's':
        return "http://img.youtube.com/vi/%s/2.jpg" % video_id
    elif args == 'l':
        return "http://img.youtube.com/vi/%s/0.jpg" % video_id
    else:
        return None

@register.filter()
def display_not_none(value):
    if value is not None:
        return value
    return ''

@register.simple_tag
def random_number(length=4):
    """
    Create a random integer with given length.
    For a length of 3 it will be between 100 and 999.
    For a length of 4 it will be between 1000 and 9999.
    """
    return randint(10**(length-1), (10**length-1))
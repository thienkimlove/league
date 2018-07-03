from django.conf.urls import url
from frontend.views import *

app_name = "frontend"

_logger = logging.getLogger('default')


def debug(msg):
    _logger.info('Application log : %s', msg)


urlpatterns = [
    url(r'^$', index, name='index'),

    url(r'^news/(?P<slug>[\w-]+)\.html$', news_detail, name='news_detail'),
    url(r'^clubs/(?P<slug>[\w-]+)\.html$', clubs_detail, name='clubs_detail'),
    url(r'^galleries/(?P<slug>[\w-]+)\.html$', galleries_detail, name='galleries_detail'),

    url(r'^news$', news, name='news'),
    url(r'^results', results, name='results'),
    url(r'^fixtures', fixtures, name='fixtures'),
    url(r'^tables', tables, name='tables'),
    url(r'^clubs$', clubs, name='clubs'),
    url(r'^players$', players, name='players'),
    url(r'^managers$', managers, name='managers'),
    url(r'^galleries$', galleries, name='galleries'),
    url(r'^reload$', reload, name='reload'),



]
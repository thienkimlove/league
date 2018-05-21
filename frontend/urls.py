from django.conf.urls import url
from frontend.views import *
from project.settings import LOG_FILE
app_name = "frontend"

def debug(msg):
    with open(LOG_FILE, 'r') as original: data = original.read()
    with open(LOG_FILE, 'w') as modified: modified.write(data +str(repr(msg))+"\n")

urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^news/(?P<slug>[\w-]+)\.html$', news_detail, name='news_detail'),
    url(r'^news$', news, name='news'),

]
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path
from filebrowser.sites import site

from project import settings

urlpatterns = [
    path('select2/', include('django_select2.urls')),
    path('admin/filebrowser/', site.urls),
    path('admin/doc/', include('django.contrib.admindocs.urls')),
    path('ckeditor/', include('core.ckeditor_uploader')),
    path('admin/', admin.site.urls),
    path('chaining/', include('smart_selects.urls')),
    path('core/', include('core.urls')),
    path('', include('frontend.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
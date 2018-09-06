### Default template for new project

* Using `CKeditor` as default


* For `slug` in model, we using `SiteSlug` for generate slug by language which unique by contents every time.

* If `settings.DEBUG` is `True`, we no need `collectstatic`. we also enable logging to console and in uWSGI log.

#### Setting for project

First time setup

```commandline
mkvirtualenv league
git clone git@github.com:thienkimlove/giaidau.git league
cd league 
pip install -r requirements.txt
mysql -uroot -ptieungao -e "CREATE DATABASE league CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
python manage.py migrate
```

### Integrate CKEditor with Filebrowser Django

1. Check file `core/ckeditor_uploader.py`

2. Edit the `project/urls.py`

```textmate
path('ckeditor/', include('core.ckeditor_uploader')),
```

3. Add to `core/templates/base.html`

```textmate
<script type="text/javascript" src="{% static "filebrowser/js/FB_CKEditor.js" %}"></script>

```

And script:

```textmate
if (CKEDITOR) {
        CKEDITOR.config.filebrowserBrowseUrl = '/admin/filebrowser/browse/?pop=3';
        CKEDITOR.config.filebrowserImageBrowseUrl = '/admin/filebrowser/browse/?pop=3';
        CKEDITOR.config.filebrowserFlashBrowseUrl = '/admin/filebrowser/browse/?pop=3';
        CKEDITOR.config.filebrowserUploadUrl = '/admin/filebrowser/browse/?pop=3';
        CKEDITOR.config.filebrowserImageUploadUrl = '/admin/filebrowser/browse/?pop=3';
        CKEDITOR.config.filebrowserFlashUploadUrl = '/admin/filebrowser/browse/?pop=3';
        //do not add extra paragraph to html
        CKEDITOR.config.autoParagraph = false;
    }
```

Read more on:

```textmate
https://overiq.com/django/1.10/integrating-ckeditor-in-django/
http://hustoknow.blogspot.com/2011/02/integrating-ckeditor-with-django.html
```
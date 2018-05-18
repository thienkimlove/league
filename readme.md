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

#### Problem with Django Smart Select

* Fix error on Js with `pip install git+https://github.com/digi604/django-smart-selects.git@js-unlinting-fixes --upgrade`

* We create `core/static/core/js/bind_fields.js` for reload the list of player in  Select Start Players and Inline Form


#### Problem with AutocompleteLight and Django Taggit

No button for create new tags.

We must install latest version of autocomplete light

`pip install -e git+https://github.com/yourlabs/django-autocomplete-light.git#egg=django-autocomplete-light --upgrade`


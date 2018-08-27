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


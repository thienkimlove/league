#!/bin/bash

echo "Site reload..."
yes yes | /root/Env/league/bin/python /var/www/html/league/manage.py collectstatic

service uwsgi restart
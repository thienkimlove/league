# Generated by Django 2.0.3 on 2018-08-27 06:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0026_auto_20180823_1100'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='matchdetail',
            name='is_penalty',
        ),
    ]
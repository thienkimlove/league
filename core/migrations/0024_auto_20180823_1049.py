# Generated by Django 2.0.3 on 2018-08-23 03:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0023_auto_20180821_1439'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='slug',
            field=models.SlugField(allow_unicode=True, default=None, null=True, max_length=255),
        ),
    ]

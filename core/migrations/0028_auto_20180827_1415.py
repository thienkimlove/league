# Generated by Django 2.0.3 on 2018-08-27 07:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0027_remove_matchdetail_is_penalty'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='match',
            name='is_end',
        ),
        migrations.AddField(
            model_name='match',
            name='Finish',
            field=models.BooleanField(default=False, verbose_name='Finish'),
        ),
    ]

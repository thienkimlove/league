# Generated by Django 2.0.3 on 2018-08-13 06:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0009_matchaction_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='bannerposition',
            name='status',
            field=models.BooleanField(default=True),
        ),
    ]

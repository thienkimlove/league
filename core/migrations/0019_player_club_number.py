# Generated by Django 2.0.3 on 2018-08-14 05:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0018_match_attend_number'),
    ]

    operations = [
        migrations.AddField(
            model_name='player',
            name='club_number',
            field=models.SmallIntegerField(blank=True, default=0, null=True),
        ),
    ]

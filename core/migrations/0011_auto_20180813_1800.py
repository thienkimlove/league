# Generated by Django 2.0.3 on 2018-08-13 11:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_bannerposition_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='end_time',
            field=models.DateTimeField(blank=True, default=None, null=True),
        ),
    ]

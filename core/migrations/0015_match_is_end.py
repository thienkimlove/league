# Generated by Django 2.0.3 on 2018-08-14 02:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0014_auto_20180813_1834'),
    ]

    operations = [
        migrations.AddField(
            model_name='match',
            name='is_end',
            field=models.BooleanField(default=False),
        ),
    ]
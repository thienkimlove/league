# Generated by Django 2.0.3 on 2018-08-27 07:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0028_auto_20180827_1415'),
    ]

    operations = [
        migrations.RenameField(
            model_name='match',
            old_name='Finish',
            new_name='is_end',
        ),
    ]
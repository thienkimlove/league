# Generated by Django 2.0.3 on 2018-08-10 04:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_gallery_content'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='matchdetail',
            name='time',
        ),
        migrations.AddField(
            model_name='matchaction',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
        migrations.AddField(
            model_name='matchdetail',
            name='minute',
            field=models.SmallIntegerField(blank=True, null=True),
        ),
    ]

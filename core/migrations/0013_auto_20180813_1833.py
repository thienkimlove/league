# Generated by Django 2.0.3 on 2018-08-13 11:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0012_auto_20180813_1805'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='bannerposition',
            options={'ordering': ['-updated_at']},
        ),
        migrations.AlterModelOptions(
            name='category',
            options={'ordering': ['-updated_at']},
        ),
        migrations.AlterModelOptions(
            name='matchaction',
            options={'ordering': ['-updated_at']},
        ),
        migrations.AlterModelOptions(
            name='matchdetail',
            options={'ordering': ['-updated_at']},
        ),
    ]
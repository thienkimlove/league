# Generated by Django 2.0.3 on 2018-07-01 11:48

import core.models
from django.db import migrations, models
import django.db.models.deletion
import django_countries.fields
import smart_selects.db_fields
import taggit.managers


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('taggit', '0002_auto_20150616_2121'),
    ]

    operations = [
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(max_length=191)),
                ('link', core.models.GeneralCharField(blank=True, max_length=191, null=True)),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to='')),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Banner',
                'verbose_name_plural': 'Banners',
            },
        ),
        migrations.CreateModel(
            name='BannerPosition',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(max_length=191)),
                ('position_key', core.models.GeneralCharField(max_length=191)),
            ],
            options={
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('desc', models.TextField(blank=True, null=True)),
                ('slug', core.models.GeneralSlug(blank=True, db_index=True, editable=False, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Club',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('slug', core.models.GeneralSlug(blank=True, db_index=True, editable=False, max_length=191, null=True)),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to='')),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Club',
                'verbose_name_plural': 'Clubs',
            },
        ),
        migrations.CreateModel(
            name='Coach',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('dob', models.DateField(blank=True, default=None, null=True)),
                ('nationality', django_countries.fields.CountryField(blank=True, default='VN', max_length=2, null=True)),
                ('height', models.PositiveSmallIntegerField(blank=True, default=None, null=True)),
                ('weight', models.PositiveSmallIntegerField(blank=True, default=None, null=True)),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to='')),
                ('status', models.BooleanField(default=True)),
                ('club', models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.Club')),
            ],
            options={
                'verbose_name': 'Coach',
                'verbose_name_plural': 'Coaches',
            },
        ),
        migrations.CreateModel(
            name='Gallery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('slug', core.models.GeneralSlug(blank=True, db_index=True, editable=False, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='')),
            ],
            options={
                'verbose_name': 'Gallery',
                'verbose_name_plural': 'Galleries',
            },
        ),
        migrations.CreateModel(
            name='League',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('slug', core.models.GeneralSlug(blank=True, db_index=True, editable=False, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'League',
                'verbose_name_plural': 'Leagues',
            },
        ),
        migrations.CreateModel(
            name='Match',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('start_time', models.DateTimeField(null=True)),
                ('end_time', models.DateTimeField(default=None, null=True)),
                ('home_end_score', models.SmallIntegerField(default=0)),
                ('away_end_score', models.SmallIntegerField(default=0)),
                ('status', models.BooleanField(default=True)),
                ('away_team', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='away_matches', to='core.Club')),
                ('home_team', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='home_matches', to='core.Club')),
                ('league', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.League')),
            ],
            options={
                'verbose_name': 'Match',
                'verbose_name_plural': 'Matches',
            },
        ),
        migrations.CreateModel(
            name='MatchAction',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
            ],
            options={
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='MatchDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('is_score', models.BooleanField(default=False)),
                ('is_penalty', models.BooleanField(default=False)),
                ('time', models.DateTimeField(blank=True, default=None, null=True)),
                ('action', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.MatchAction')),
                ('match', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Match')),
            ],
            options={
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Player',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('slug', core.models.GeneralSlug(blank=True, db_index=True, editable=False, max_length=191, null=True)),
                ('dob', models.DateField(blank=True, default=None, null=True)),
                ('nationality', django_countries.fields.CountryField(blank=True, default='VN', max_length=2, null=True)),
                ('height', models.PositiveSmallIntegerField(blank=True, default=None, null=True)),
                ('weight', models.PositiveSmallIntegerField(blank=True, default=None, null=True)),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to='')),
                ('status', models.BooleanField(default=True)),
                ('club', models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.Club')),
            ],
            options={
                'verbose_name': 'Player',
                'verbose_name_plural': 'Players',
            },
        ),
        migrations.CreateModel(
            name='PlayerHistory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('club', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Club')),
                ('player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Player')),
            ],
            options={
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Position',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
                ('is_goal_keeper', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name': 'Position',
                'verbose_name_plural': 'Positions',
            },
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('desc', models.TextField(blank=True, null=True)),
                ('slug', core.models.GeneralSlug(blank=True, db_index=True, editable=False, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='')),
                ('content', models.TextField(blank=True, null=True)),
                ('views', models.IntegerField(default=0, editable=False)),
                ('display_place', core.models.GeneralCharField(blank=True, choices=[('block_1', 'Vị trí trung tâm trang chủ'), ('block_2', 'Block 2 trang chủ')], max_length=191, null=True)),
                ('category', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.Category')),
                ('tags', taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags')),
            ],
            options={
                'verbose_name': 'Post',
                'verbose_name_plural': 'Posts',
            },
        ),
        migrations.CreateModel(
            name='Referee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('dob', models.DateField(blank=True, default=None, null=True)),
                ('nationality', django_countries.fields.CountryField(blank=True, default='VN', max_length=2, null=True)),
                ('height', models.PositiveSmallIntegerField(blank=True, default=None, null=True)),
                ('weight', models.PositiveSmallIntegerField(blank=True, default=None, null=True)),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to='')),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Referee',
                'verbose_name_plural': 'Referees',
            },
        ),
        migrations.CreateModel(
            name='Season',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Season',
                'verbose_name_plural': 'Seasons',
            },
        ),
        migrations.CreateModel(
            name='SiteSlug',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', core.models.GeneralCharField(max_length=191)),
                ('content', core.models.GeneralCharField(max_length=191)),
            ],
        ),
        migrations.CreateModel(
            name='Social',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='')),
                ('social_type', core.models.GeneralCharField(blank=True, choices=[('facebook', 'Facebook'), ('google', 'Google'), ('twitter', 'Twitter')], max_length=191, null=True)),
                ('social_link', core.models.GeneralCharField(blank=True, max_length=191, null=True)),
            ],
            options={
                'verbose_name': 'Social',
                'verbose_name_plural': 'Socials',
            },
        ),
        migrations.CreateModel(
            name='Sponsor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('link', core.models.GeneralCharField(blank=True, default=None, max_length=191, null=True)),
                ('slug', core.models.GeneralSlug(blank=True, db_index=True, editable=False, max_length=191, null=True)),
                ('status', models.BooleanField(default=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='')),
            ],
            options={
                'verbose_name': 'Sponsor',
                'verbose_name_plural': 'Sponsors',
            },
        ),
        migrations.CreateModel(
            name='Stadium',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', core.models.GeneralCharField(default=None, max_length=191, null=True)),
                ('capable', models.PositiveIntegerField(blank=True, default=None, null=True)),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to='')),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Stadium',
                'verbose_name_plural': 'Stadiums',
            },
        ),
        migrations.AlterUniqueTogether(
            name='siteslug',
            unique_together={('slug', 'content')},
        ),
        migrations.AddField(
            model_name='player',
            name='position',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.Position'),
        ),
        migrations.AddField(
            model_name='matchdetail',
            name='player',
            field=models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.Player'),
        ),
        migrations.AddField(
            model_name='match',
            name='referee',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Referee'),
        ),
        migrations.AddField(
            model_name='match',
            name='stadium',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Stadium'),
        ),
        migrations.AddField(
            model_name='match',
            name='start_away_team',
            field=smart_selects.db_fields.ChainedManyToManyField(chained_field='away_team', chained_model_field='club', related_name='start_away_team', to='core.Player'),
        ),
        migrations.AddField(
            model_name='match',
            name='start_home_team',
            field=smart_selects.db_fields.ChainedManyToManyField(chained_field='home_team', chained_model_field='club', related_name='start_home_team', to='core.Player'),
        ),
        migrations.AddField(
            model_name='league',
            name='season',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.Season'),
        ),
        migrations.AddField(
            model_name='club',
            name='stadium',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.Stadium'),
        ),
        migrations.AddField(
            model_name='banner',
            name='position',
            field=models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.BannerPosition'),
        ),
    ]

# Generated by Django 2.0.3 on 2018-07-03 07:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_auto_20180702_1204'),
    ]

    operations = [
        migrations.CreateModel(
            name='CoachHistory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('date', models.DateField(blank=True, default=None, null=True)),
                ('club', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Club')),
                ('coach', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Coach')),
            ],
        ),
        migrations.AlterModelOptions(
            name='playerhistory',
            options={},
        ),
        migrations.AddField(
            model_name='playerhistory',
            name='date',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AddField(
            model_name='season',
            name='end_date',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AddField(
            model_name='season',
            name='start_date',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AlterUniqueTogether(
            name='playerhistory',
            unique_together={('player', 'club', 'date')},
        ),
        migrations.AlterUniqueTogether(
            name='coachhistory',
            unique_together={('coach', 'club', 'date')},
        ),
    ]

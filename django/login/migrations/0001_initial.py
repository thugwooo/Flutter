# Generated by Django 3.2.5 on 2021-10-17 14:06

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='userData',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10)),
                ('phoneNumber', models.CharField(max_length=10)),
                ('pet', models.CharField(max_length=5)),
                ('breed', models.TextField()),
                ('birthYear', models.TextField()),
                ('birthMonth', models.TextField()),
                ('birthDay', models.TextField()),
                ('birthM', models.TextField()),
                ('sex', models.TextField()),
                ('neu', models.TextField()),
                ('weight', models.TextField()),
                ('bcs', models.TextField()),
                ('alg', models.TextField()),
                ('health', models.TextField()),
            ],
        ),
    ]
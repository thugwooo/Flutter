# Generated by Django 3.2.5 on 2021-10-17 16:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0003_alter_userdata_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userdata',
            name='phoneNumber',
            field=models.CharField(max_length=12),
        ),
    ]

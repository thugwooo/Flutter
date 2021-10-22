from django.db import models

# Create your models here.
class userData(models.Model):
    name = models.CharField(max_length=12)
    phoneNumber = models.CharField(max_length=12)
    pet = models.CharField(max_length=5)
    breed = models.TextField()
    birthYear = models.TextField()
    birthMonth = models.TextField()
    birthDay = models.TextField()
    
    sex = models.TextField()
    neu = models.TextField()
    weight = models.TextField()
    bcs = models.TextField()
    alg = models.TextField()
    health = models.TextField()
    petfood = models.TextField(null = True)



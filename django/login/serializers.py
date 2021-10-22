from rest_framework import serializers
from .models import userData

class userDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = userData
        fields = ('name','phoneNumber','pet','breed','birthYear','birthMonth','birthDay','sex','neu','weight','bcs','alg','health','petfood',)

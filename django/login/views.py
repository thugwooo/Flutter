from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import userData
from .serializers import userDataSerializer
import json
# Create your views here.
@api_view(['GET'])
def helloAPI(request):
    return Response('hello world!')

@api_view(['GET'])
def getuserData(request):
    totaluserData = userData.objects.all()
    serializer = userDataSerializer(totaluserData, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def saveuserData(request):
    data =json.loads(request.body) 
    print(data)
    user = userData()
    user.name = data['name']
    user.phoneNumber = data['phoneNumber']
    user.pet = data['pet']
    user.breed = data['breed']
    user.birthYear = data['birthYear']
    user.birthMonth = data['birthMonth']
    user.birthDay = data['birthDay']
    user.sex = data['sex']
    user.neu = data['neu']
    user.weight = data['weight']
    user.bcs = data['bcs']
    user.alg = data['alg']
    user.health = data['health']
    user.save()
    return Response("access")
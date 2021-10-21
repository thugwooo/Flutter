from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import userData
from .serializers import userDataSerializer

# Create your views here.
@api_view(['GET'])
def helloAPI(request):
    return Response('hello world!')

@api_view(['GET'])
def getuserData(request):
    totaluserData = userData.objects.all()
    serializer = userDataSerializer(totaluserData, many=True)
    return Response(serializer.data)
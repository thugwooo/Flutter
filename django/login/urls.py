from django.urls import path, include
from .views import helloAPI,getuserData

urlpatterns = [
    path("hello/",helloAPI),
    path("getuserData/",getuserData),
]

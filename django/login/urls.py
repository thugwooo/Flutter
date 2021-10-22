from django.urls import path, include
from .views import helloAPI,getuserData, saveuserData

urlpatterns = [
    path("hello/",helloAPI),
    path("getuserData/",getuserData),
    path("saveuserData/",saveuserData),
]

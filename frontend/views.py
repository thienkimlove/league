from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from core.models import *


def index(request):
    posts = Post.objects.all()
    return render(request, 'frontend/index.html', {'posts' : posts})
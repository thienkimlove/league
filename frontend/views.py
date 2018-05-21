from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from core.models import *



def index(request):
    block_1_posts = Post.objects.filter(status=True).filter(display_place='block_1').order_by('-created_at')[:4]
    index_banners = Banner.objects.filter(status=True).all()
    block_2_posts = Post.objects.filter(status=True).filter(display_place='block_2').order_by('-created_at')[:4]
    
    return render(request, 'frontend/index.html', {'block_1_posts' : block_1_posts, 'index_banners' : index_banners, 'block_2_posts' : block_2_posts})


def news(request):
    return render(request, 'frontend/news.html', {})

def news_detail(request, slug):    
     if Post.objects.filter(slug=slug).exists():
        return render(request, 'frontend/news_detail.html', {})    
     else:
        return redirect('frontend:index')
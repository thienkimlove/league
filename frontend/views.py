from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from core.models import *



def index(request):
    posts = Post.objects.filter(status=True).all()
    index_banners = Banner.objects.filter(status=True).all()
    latest_post = Post.objects.filter(status=True).latest(field_name='created_at')
    related_posts = latest_post.tags.similar_objects()[0:3]
    return render(request, 'frontend/index.html', {'posts' : posts, 'index_banners' : index_banners, 'latest_post' : latest_post, 'related_posts' : related_posts})


def news(request):
    return render(request, 'frontend/news.html', {})

def news_detail(request, slug):    
     if Post.objects.filter(slug=slug).exists():
        return render(request, 'frontend/news_detail.html', {})    
     else:
        return redirect('frontend:index')
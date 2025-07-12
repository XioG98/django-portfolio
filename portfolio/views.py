from django.shortcuts import render

def home(request):
    return render(request, 'portfolio/home.html')

def projects(request):
    return render(request, 'portfolio/projects.html')

def contact(request):
    return render(request, 'portfolio/contact.html')

def aboutme(request):
    return render(request, 'portfolio/aboutme.html')
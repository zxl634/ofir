from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello, world. You're on your way to finding your dream job!")

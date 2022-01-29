from .base import *  # noqa
import environ
import django_heroku


env = environ.Env()
SECURE_SSL_REDIRECT = True
ALLOWED_HOSTS = []
DEBUG = False
DATABASE_URL = "psql://djangofir:localpassword@127.0.0.1/djangofir"
STATIC_URL = "https://static.decoupled-django.com"
STATIC_ROOT = "static/"

django_heroku.settings(locals())

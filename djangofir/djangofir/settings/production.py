from .base import *  # noqa
import environ
import django_heroku


env = environ.Env()
SECURE_SSL_REDIRECT = True
ALLOWED_HOSTS = env.list("ALLOWED_HOSTS")
STATIC_ROOT = env("STATIC_ROOT")

django_heroku.settings(locals())

from django.urls import path
from . import views
from .api.views import JobList, JobDetail

app_name = "jobs"

urlpatterns = [
    path("", views.index, name="index"),
    path("api/posts/", JobList.as_view(), name="list"),
    path("api/posts/<int:pk>", JobDetail.as_view(), name="detail"),
]

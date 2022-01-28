from jobs.models import Job
from rest_framework import serializers


class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ["title", "body", "created_at", "status", "id"]

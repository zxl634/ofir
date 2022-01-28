from .serialisers import JobSerializer
from jobs.models import Job
from rest_framework.generics import ListAPIView, RetrieveAPIView


class JobList(ListAPIView):
    serializer_class = JobSerializer
    queryset = Job.objects.all()


class JobDetail(RetrieveAPIView):
    serializer_class = JobSerializer
    queryset = Job.objects.all()

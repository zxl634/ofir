from django.test import TestCase
from jobs.models import Job
from users.models import User


class JobTestCase(TestCase):
    def setUp(self):
        user = User.objects.create(name="test user")
        Job.objects.create(title="Cool job", body="Body text", user=user)

    def test_jobs(self):
        job = Job.objects.get(title="Cool job")
        self.assertEqual(job.body, 'Body text')

from rest_framework.test import APITestCase
from rest_framework.status import HTTP_403_FORBIDDEN, HTTP_200_OK, HTTP_201_CREATED
from django.urls import reverse


class TestBillingAPI(APITestCase):
    @classmethod
    def setUpTestData(cls):
        pass

    def test_can_get_list_of_job_posts(self):
        response = self.client.get(reverse("jobs:list"))
        self.assertEqual(response.status_code, HTTP_200_OK)

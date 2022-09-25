"""Unit test cases"""
from unittest import TestCase

from fastapi.testclient import TestClient
from fastapi_sample.main import APP

client = TestClient(APP)

class SuccessTests(TestCase):
    """Positive Test cases"""
    def test_get_items(self) -> None:
        """
        Test case to verify success scenario
        """
        expected_body = {"message": "Hello World"}
        response = client.get("/items/")

        assert response.status_code == 200
        result = response.json()
        assert result == expected_body

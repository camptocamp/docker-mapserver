"""
Common fixtures for every tests.
"""
import pytest
from c2cwsgiutils.acceptance import utils
from c2cwsgiutils.acceptance.connection import Connection

BASE_URL = "http://mapserver:8080/"


@pytest.fixture
def connection():
    """
    Fixture that returns a connection to a running batch container.
    """
    utils.wait_url(BASE_URL + "?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAME=polygons&featureId=xxx")
    return Connection(BASE_URL, "http://localhost")

"""
Common fixtures for every tests.
"""
import pytest
from c2cwsgiutils.acceptance import utils
from c2cwsgiutils.acceptance.composition import Composition
from c2cwsgiutils.acceptance.connection import Connection

BASE_URL = "http://" + utils.DOCKER_GATEWAY + ":8380/"
BASE_URL_MAP = "http://" + utils.DOCKER_GATEWAY + ":8381/"


def wait_mapserver():
    utils.wait_url(BASE_URL + "?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAME=polygons&featureId=xxx")


@pytest.fixture(scope="session")
def composition(request):
    """
    Fixture that start/stop the Docker composition used for all the tests.
    """
    result = Composition(request, "mapserver", "docker-compose.yaml")
    wait_mapserver()
    return result


@pytest.fixture
def connection(composition):
    """
    Fixture that returns a connection to a running batch container.
    """
    return Connection(BASE_URL, "http://localhost")


@pytest.fixture
def connection_map():
    """
    Fixture that returns a connection to a running batch container.
    """
    utils.wait_url(
        BASE_URL_MAP + "?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAME=polygons&featureId=xxx"
    )
    return Connection(BASE_URL_MAP, "http://localhost")

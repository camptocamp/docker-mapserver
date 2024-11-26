"""
Common fixtures for every tests.
"""

import pytest
from c2cwsgiutils.acceptance import utils
from c2cwsgiutils.acceptance.connection import Connection

BASE_URL = "http://mapserver:8080"
BASE_URL_MAP = "http://mapserver-map:8080"
BASE_URL_OGCAPI = "http://mapserver-ogcapi:8080/mymap/ogcapi"
BASE_URL_BASE_PATH = "http://mapserver-path:8080/this/is/a/test"
BASE_URL_LIGHTTPD = "http://mapserver-lighttpd:8080"


@pytest.fixture
def connection():
    """
    Fixture that returns a connection to a running batch container.
    """
    utils.wait_url(BASE_URL + "?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAME=polygons&featureId=xxx")
    return Connection(BASE_URL, "http://localhost")


@pytest.fixture
def connection_map():
    """
    Fixture that returns a connection to a running batch container.
    """
    utils.wait_url(
        BASE_URL_MAP
        + "?MAP=/etc/mapserver/mapserver.map&SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAME=polygons&featureId=xxx"
    )
    return Connection(BASE_URL_MAP, "http://localhost")


@pytest.fixture
def connection_ogcapi():
    """
    Fixture that returns a connection to a running batch container.
    """
    utils.wait_url(BASE_URL_OGCAPI + "/collections/polygons?f=html")
    return Connection(BASE_URL_OGCAPI, "http://localhost")


@pytest.fixture
def connection_lighttpd():
    """
    Fixture that returns a connection to a running batch container.
    """
    utils.wait_url(BASE_URL_LIGHTTPD)
    return Connection(BASE_URL_LIGHTTPD, "http://localhost")

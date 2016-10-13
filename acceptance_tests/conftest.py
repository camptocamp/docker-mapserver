"""
Common fixtures for every tests.
"""
import pytest

from acceptance_tests import Composition, Connection, wait_mapserver


@pytest.fixture(scope="session")
def composition(request):
    """
    Fixture that start/stop the Docker composition used for all the tests.
    """
    return Composition(request)


@pytest.fixture
def connection(composition):
    """
    Fixture that returns a connection to a running batch container.
    """
    return Connection(composition)

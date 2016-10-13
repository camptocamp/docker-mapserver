import logging
import os
import requests
import subprocess
import sys
import time
from xml.etree import ElementTree

from acceptance_tests import utils


BASE_URL = 'http://host:8380/' if utils.in_docker() else 'http://localhost:8380/'
LOG = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG, format="TEST                 | %(asctime)-15s %(levelname)5s %(name)s %(message)s", stream=sys.stdout)
logging.getLogger("requests.packages.urllib3.connectionpool").setLevel(logging.WARN)
PROJECT_NAME='mapserver'


class Composition(object):
    def __init__(self, request, composition="docker-compose.yml"):
        self.composition = composition
        env = Composition._get_env()
        if os.environ.get("docker_stop", "1") == "1":
            request.addfinalizer(self.stop_all)
        if os.environ.get("docker_start", "1") == "1":
            subprocess.check_call(['docker-compose', '--file', composition,
                                   '--project-name', PROJECT_NAME, 'rm', '-f'], env=env,
                                  stderr=subprocess.STDOUT)

            # to rebuild testDB, if needed
            subprocess.check_call(['docker-compose', '--file', composition,
                                   '--project-name', PROJECT_NAME, 'build'], env=env,
                                  stderr=subprocess.STDOUT)

            subprocess.check_call(['docker-compose', '--file', composition,
                                   '--project-name', PROJECT_NAME, 'up', '-d'], env=env,
                                  stderr=subprocess.STDOUT)

        # setup something that redirects the docker container logs to the test output
        log_watcher = subprocess.Popen(['docker-compose', '--file', composition,
                                       '--project-name', PROJECT_NAME, 'logs', '--follow', '--no-color'],
                                       env=env, stderr=subprocess.STDOUT)
        request.addfinalizer(log_watcher.kill)
        wait_mapserver()

    def stop_all(self):
        subprocess.check_call(['docker-compose', '--file', self.composition,
                               '--project-name', PROJECT_NAME, 'stop'], env=Composition._get_env(),
                              stderr=subprocess.STDOUT)

    def stop(self, container):
        subprocess.check_call(['docker', '--log-level=warn',
                               'stop', '%s_%s_1' % (PROJECT_NAME, container)],
                              stderr=subprocess.STDOUT)

    def restart(self, container):
        subprocess.check_call(['docker', '--log-level=warn',
                               'restart', '%s_%s_1' % (PROJECT_NAME, container)],
                              stderr=subprocess.STDOUT)

    @staticmethod
    def _get_env():
        """
        Make sure the DOCKER_TAG environment variable, used in the docker-compose.yml file
        is correctly set when we call docker-compose.
        """
        env = dict(os.environ)
        if 'DOCKER_TAG' not in env:
            env['DOCKER_TAG'] = 'latest'
        return env


def wait_mapserver():
    timeout = time.time() + 60.0
    while True:
        try:
            LOG.info("Trying to connect to MapServer... ")
            r = requests.get(BASE_URL + '?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAME=polygons&featureId=xxx')
            if r.status_code == 200:
                LOG.info("MapServer started")
                break
        except:
            pass
        if time.time() > timeout:
            assert False, "Timeout"
        time.sleep(0.5)


class Connection(object):
    def __init__(self, compo, base_url=BASE_URL):
        self.base_url = base_url
        self.composition = compo

    def get(self, url, expected_status=200):
        """
        get the given URL (relative to the root of mapserver).
        """
        r = requests.get(self.base_url + url)
        try:
            check_response(r, expected_status)
            return r
        finally:
            r.close()

    def get_xml(self, url, expected_status=200):
        """
        get the given URL (relative to the root of mapserver) as XML.
        """
        r = requests.get(self.base_url + url, stream=True)
        r.raw.decode_content = True
        try:
            check_response(r, expected_status)
            return ElementTree.parse(r.raw).getroot()
        finally:
            r.close()


def check_response(r, expected_status=200):
    if isinstance(expected_status, tuple):
        assert r.status_code in expected_status, "status=%d\n%s" % (r.status_code, r.text)
    else:
        assert r.status_code == expected_status, "status=%d\n%s" % (r.status_code, r.text)

import os

def in_docker():
    return os.environ.get("DOCKER_RUN", "0") == "1"

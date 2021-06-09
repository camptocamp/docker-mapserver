FROM ubuntu:20.04
RUN \
    apt-get update && \
    apt-get install --assume-yes --no-install-recommends python3-pip && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/*

WORKDIR /tmp

COPY requirements.txt ./
RUN python3 -m pip install --disable-pip-version-check --no-cache-dir --requirement=requirements.txt && \
    rm --recursive --force /tmp/*

COPY Pipfile Pipfile.lock ./
RUN pipenv sync --system --clear && \
    rm --recursive --force /usr/local/lib/python3.*/dist-packages/tests/ /tmp/* /root/.cache/*

WORKDIR /acceptance_tests
COPY . ./

CMD ["tail", "-f", "/dev/null"]

ENV C2C_REQUESTS_DEFAULT_TIMEOUT=10

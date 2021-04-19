FROM camptocamp/c2cwsgiutils:5

COPY . /acceptance_tests/

WORKDIR /acceptance_tests

CMD tail -f /dev/null
CMD py.test -vv --color=yes --junitxml /tmp/junitxml/results.xml

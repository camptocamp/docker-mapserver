def test_get_capabilities(connection):
    ns = "{http://www.opengis.net/wms}"
    answer = connection.get_xml("?SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.3.0")
    assert [e.text for e in answer.findall("%sService/%sTitle" % (ns, ns))] == ["test"]
    assert [e.text for e in answer.findall(".//%sLayer/%sName" % (ns, ns))] == ["test", "polygons"]


def test_get_map(connection):
    answer = connection.get_raw(
        "?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&LAYERS=polygons&STYLES=&CRS=EPSG:4326&BBOX=-180,-90,180,90&WIDTH=600&HEIGHT=300&FORMAT=image/png"
    )
    if answer.headers["content-type"] != "image/png":
        print(answer.text)
    assert answer.headers["content-type"] == "image/png"


def test_other_url(connection):
    connection.get(
        "toto/tutu?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&LAYERS=polygons&STYLES=&CRS=EPSG:4326&BBOX=-180,-90,180,90&WIDTH=600&HEIGHT=300&FORMAT=image/png"
    )

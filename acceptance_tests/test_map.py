def test_get_std_map(connection_map):
    ns = "{http://www.opengis.net/wms}"
    answer = connection_map.get_xml(
        "?MAP=/etc/mapserver/mapserver.map&SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.3.0"
    )
    assert [e.text for e in answer.findall("%sService/%sTitle" % (ns, ns))] == ["test"]
    assert [e.text for e in answer.findall(".//%sLayer/%sName" % (ns, ns))] == ["test", "polygons"]


def test_get_multi_char_map(connection_map):
    ns = "{http://www.opengis.net/wms}"
    answer = connection_map.get_xml(
        "?MAP=/etc/mapserver/AZ_az-0.9.map&SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.3.0"
    )
    assert [e.text for e in answer.findall("%sService/%sTitle" % (ns, ns))] == ["test"]
    assert [e.text for e in answer.findall(".//%sLayer/%sName" % (ns, ns))] == ["test", "polygons"]


def test_get_folder_map(connection_map):
    ns = "{http://www.opengis.net/wms}"
    answer = connection_map.get_xml(
        "?MAP=/etc/mapserver/AZ_az-0.9/AZ_az-0.9.map&SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.3.0"
    )
    assert [e.text for e in answer.findall("%sService/%sTitle" % (ns, ns))] == ["test"]
    assert [e.text for e in answer.findall(".//%sLayer/%sName" % (ns, ns))] == ["test", "polygons"]

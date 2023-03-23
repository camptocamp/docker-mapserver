def test_get_feature(connection):
    answer = connection.get_xml(
        "?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAME=polygons&featureId=polygons.foo"
    )
    features = answer.findall(".//{http://mapserver.gis.umn.edu/mapserver}polygons")
    assert len(features) == 1

from owslib.ogcapi.features import Features

from .conftest import BASE_URL_OGCAPI


def test_ogcapi(connection_ogcapi):
    # test if the url templating is correct in HTML document
    answer = connection_ogcapi.get_raw("collections/polygons?f=html")
    print(answer)
    assert "http://localhost:8385/mapserver/mymap/ogcapi/collections/polygons/items?f=html" in answer.text


def test_ogcapi_valid_feature():
    w = Features(BASE_URL_OGCAPI)
    polygons_items = w.collection_items("polygons")
    assert "foo" == polygons_items["features"][0]["properties"]["name"]

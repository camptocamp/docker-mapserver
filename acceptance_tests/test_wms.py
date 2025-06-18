import pytest
from c2cwsgiutils.acceptance.connection import CacheExpected
from owslib.wms import WebMapService

from .conftest import BASE_URL, BASE_URL_BASE_PATH


def test_get_capabilities(connection):
    ns = "{http://www.opengis.net/wms}"
    answer = connection.get_xml("?SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.3.0")
    assert [e.text for e in answer.findall(f"{ns}Service/{ns}Title")] == ["test"]
    assert [e.text for e in answer.findall(f".//{ns}Layer/{ns}Name")] == ["test", "polygons"]


def test_get_map(connection):
    answer = connection.get_raw(
        "?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&LAYERS=polygons&STYLES=&CRS=EPSG:4326&BBOX=-180,-90,180,90&WIDTH=600&HEIGHT=300&FORMAT=image/png"
    )
    assert answer.headers["content-type"] == "image/png", (
        f"{answer.headers['content-type']} != 'image/png'\n{answer.text}"
    )


def test_other_url(connection):
    connection.get(
        "toto/tutu?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&LAYERS=polygons&STYLES=&CRS=EPSG:4326&BBOX=-180,-90,180,90&WIDTH=600&HEIGHT=300&FORMAT=image/png"
    )


@pytest.mark.parametrize("wms_url", [BASE_URL, BASE_URL_BASE_PATH])
def test_capabilities_url(wms_url):
    wms = WebMapService(wms_url)
    assert wms.getOperationByName("GetMap").methods[0]["url"].startswith(wms_url), (
        f"url mismatch between requested PATH and Capabilities GET path"
    )


@pytest.mark.parametrize("wms_url", [BASE_URL, BASE_URL_BASE_PATH])
def test_wms_polygon_layer_presence(wms_url):
    wms = WebMapService(wms_url)
    assert "polygons" in wms.contents, f"Layer 'polygons' not found in the WMS capabilities"


def test_lighttpd(connection_lighttpd):
    ns = "{http://www.opengis.net/wms}"
    answer = connection_lighttpd.get_xml(
        "?SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.3.0",
        cache_expected=CacheExpected.DONT_CARE,
        cors=False,
    )
    from lxml import etree

    print(etree.tostring(answer, pretty_print=True).decode())
    assert [e.text for e in answer.findall(f"{ns}Service/{ns}Title")] == ["test"]
    assert [e.text for e in answer.findall(f".//{ns}Layer/{ns}Name")] == ["test", "polygons"]

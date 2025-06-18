def test_get_tile(connection):
    answer = connection.get_raw("?layer=polygons&mode=tile&tilemode=gmap&tile=0+0+0")
    assert answer.headers["content-type"] == "image/jpeg", (
        f"{answer.headers['content-type']} != 'image/png'\n{answer.text}"
    )

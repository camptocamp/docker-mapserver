def test_get_tile(connection):
    answer = connection.get_raw("?layer=polygons&mode=tile&tilemode=gmap&tile=0+0+0")
    if answer.headers["content-type"] != 'image/jpeg':
        print(answer.text)
    assert answer.headers["content-type"] == 'image/jpeg'

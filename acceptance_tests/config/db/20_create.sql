CREATE EXTENSION postgis;

CREATE TABLE polygons (
    name TEXT NOT NULL,
    PRIMARY KEY (name)
);
SELECT AddGeometryColumn('polygons', 'geom', 4326, 'POLYGON', 2);

INSERT INTO polygons (name, geom) VALUES ('foo', ST_GeomFromText('POLYGON((-50 -50,50 -50,50 50,-50 -50))', 4326));

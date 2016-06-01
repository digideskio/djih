CREATE TABLE TEST_GEO (
    id serial PRIMARY KEY,
    info TEXT,
    lat double precision,
    lon double precision
);

INSERT INTO test_geo (info, lat, lon) VALUES ('work', 37.783242, -122.392965);

INSERT INTO test_geo (info, lat, lon) VALUES ('home', 37.776602, -122.393413);

INSERT INTO test_geo (info, lat, lon) VALUES ('fort funston', 37.717114, -122.502634);



SELECT id, info, earth_distance(ll_to_earth( 37.783242, -122.392965), ll_to_earth(lat, lon)) as distance_from_current_location FROM test_geo ORDER BY distance_from_current_location ASC;


SELECT id, info, earth_distance(ll_to_earth( 37.783242, -122.392965), ll_to_earth(lat, lon)) as distance FROM test_geo where earth_distance(ll_to_earth( 37.783242, -122.392965), ll_to_earth(lat, lon)) <  ORDER BY distance ASC;


SELECT id, info FROM test_geo WHERE earth_box( 37.783242, -122.392965, 800) @> ll_to_earth(lat, lon);


CREATE INDEX test_geo_lat_lng on test_geo USING gist(ll_to_earth(lat, lon));
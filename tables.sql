# albums
1. id
2. name - ignored
3. location
4. date
5. cover photo id
6. category - travel/food


CREATE TABLE IF NOT EXISTS albums(
    id SERIAL PRIMARY KEY,
    name TEXT,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    cover_photo_id INTEGER NOT NULL,
    category TEXT NOT NULL
);

CREATE INDEX albums_category_idx ON albums (category);

SELECT a.location, a.date, p.filename, p.width, p.height FROM albums AS a INNER JOIN photos AS p ON a.cover_photo_id = p.id WHERE a.category = 'travel' ORDER BY date DESC;




INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Vancouver 2015', 'Vancouver, CA', '09/10/2015', 1, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Crater Lake 2015', 'Crater Lake, OR', '09/05/2015', 2, 'travel');








CREATE TABLE IF NOT EXISTS photos(
    id SERIAL PRIMARY KEY,
    filename TEXT NOT NULL,
    title TEXT,
    location TEXT,
    camera TEXT,
    focal_length TEXT,
    aperture TEXT,
    shutter_speed TEXT,
    iso INTEGER,
    date_taken DATE,
    width INTEGER,
    height INTEGER
);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES (
    'vancouver-2015/DSC_3147.jpg', 'Stanley Park', 'Nikon D7100', '10mm', 'f/8', '1.3s', 100, '09/11/2015', 1440, 620);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES (
    'crater-lake-2015/DSC_2856.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/8', '30s', 100, '09/11/2015', 1440, 977);




CREATE TABLE IF NOT EXISTS album_photos(
    id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL
);

CREATE INDEX album_photos_album_idx ON album_photos (album_id);

INSERT INTO album_photos (album_id, photo_id) VALUES (1, 1);

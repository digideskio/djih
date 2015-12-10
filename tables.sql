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

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Caltopia 2015', 'Berkeley, CA', '08/23/2015', 3, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Mission Peak 2015', 'Mission Peak, CA', '07/12/2015', 4, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Los Angelos 2015', 'Los Angelos, CA', '05/24/2015', 6, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Napa 2015', 'Napa, CA', '04/26/2015', 7, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Taiwan 2015', 'Taipei, TW', '03/21/2015', 8, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Boston 2014', 'Boston, MA', '12/28/2014', 9, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Chicago 2014', 'Chicago, IL', '11/23/2014', 10, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Hong Kong 2014', 'Hong Kong, PRC', '09/14/2014', 11, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('San Francisco 2014', 'San Francisco, CA', '06/30/2014', 12, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('New York City 2013', 'New York, NY', '12/24/2013', 13, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('
    New York City 2013', 'New York, NY', '08/17/2013', 14, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Chicago 2013', 'Chicago, IL', '07/04/2013', 15, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Hong Kong 2012', 'Hong Kong, PRC', '12/07/2012', 16, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Taiwan 2012', 'Taipei, TW', '12/02/2012', 17, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('New York 2012', 'New York, NY', '09/01/2012', 18, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('San Francisco 2012', 'San Francisco, CA', '08/17/2012', 19, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Inyokern 2012', 'Inyokern, CA', '03/28/2012', 20, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Newton 2012', 'Newton, MA', '03/16/2012', 21, 'travel');



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


# Cover photos
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES (
    'vancouver-2015/DSC_3147.jpg', 'Stanley Park', 'Nikon D7100', '10mm', 'f/8', '1.3s', 100, '09/11/2015', 1440, 620);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES (
    'crater-lake-2015/DSC_2856.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/8', '30s', 100, '09/11/2015', 1440, 977);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('caltopia-2015/DSC_2773.jpg', 'Berkeley', 'Nikon D7100', '10mm', 'f/11', '1/500s', 400, '08/23/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('mission-peak-2015/DSC_2607.jpg', 'Mission Peak', 'Nikon D7100', '13mm', 'f/7.1', '1/100s', 500, '07/12/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1517.jpg', 'Getty Villa', 'Nikon D7100', '10mm', 'f/8', '1/2000s', 500, '05/24/2015', 1440, 960);

-- INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1619.jpg', 'Beckman Auditorium, Caltech', 'Nikon D7100', '10mm', 'f/8', '1/800s', 800, '05/25/2015', 1440, 866);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1075.jpg', 'Chiang Kai-shek Memorial Hall', 'Nikon D7100', '20mm', 'f/8', '1/320s', 160, '03/26/2015', 1440, 838);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('napa-2015/DSC_1230.jpg', 'Napa', 'Nikon D7100', '55mm', 'f/2.8', '1/1000s', 100, '04/26/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('boston-2014/DSC_0547.jpg', 'Boston', 'Nikon D7100', '10mm', 'f/13', '1/160s', 400, '12/31/2014', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0171.jpg', 'Chicago', 'Nikon D5100', '10mm', 'f/8', '1/800s', 250, '11/25/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('hong-kong-2014/DSC_0540.jpg', 'Hong Kong', 'Nikon D5100', '10mm', 'f/8', '1/400s', 1000, '09/14/2014', 1440, 870);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('san-francisco-2014/DSC_0721.jpg', 'San Francisco', 'Nikon D5100', '10mm', 'f/22', '1/60s', 100, '07/13/2014', 960, 636);


INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('new-york-2013/1537842_10201326507305054_1391125307_o.jpg', 'New York City', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 100, '12/24/2013', 1440, 954);


INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('new-york-summer-2013/1116116_10200575878779810_1123777098_o.jpg', 'New York City', 'Nikon D5100', '35mm', 'f/1.8', '10s', 100, '08/17/2013', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2013/1048515_10200327796577910_224028052_o.jpg', 'Chicago', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 100, '07/04/2013', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('hong-kong-2012/735660_4274821589141_964558657_o.jpg', 'Hong Kong', 'Nikon D5100', '35mm', 'f/1.8', '10s', 100, '12/10/2012', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2012/741042_4315623169155_1120544796_o.jpg', 'Taiwan', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 100, '12/13/2012', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('new-york-2012/337315_3782397958858_1481914010_o.jpg', 'New York City', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 100, '09/02/2012', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('san-francisco-2012/621145_3750092351238_1070633725_o.jpg', 'San Francisco', 'Nikon D5100', '35mm', 'f/1.8', '1/80s', 100, '08/17/2012', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('inyokern-2012/413995_3216751898060_1358359544_o.jpg', 'Inyokern', 'Nikon D5100', '18mm', 'f/3.5', '1/80s', 100, '03/28/2012', 1440, 954);


INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('newton-2012/472883_3049464995992_1890335534_o.jpg', 'Newton', 'Nikon D5100', '18mm', 'f/3.5', '1/60s', 400, '03/16/2012', 1440, 954);



# Album photos - Vancouver

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3071.jpg', 'Vancouver', 'Nikon D7100', '10mm', 'f/8', '1/2000s', 1000, '09/11/2015', 1440, 871);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3087.jpg', 'Vancouver', 'Nikon D7100', '10mm', 'f/8', '1/800s', 500, '09/11/2015', 1440, 810);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3114.jpg', 'Stanley Park', 'Nikon D7100', '20mm', 'f/8', '13s', 100, '09/11/2015', 1440, 826);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3122.jpg', 'Stanley Park', 'Nikon D7100', '10mm', 'f/8', '15s', 100, '09/11/2015', 1440, 771);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3128.jpg', 'Stanley Park', 'Nikon D7100', '11mm', 'f/8', '1s', 100, '09/11/2015', 1440, 776);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3156.jpg', 'Stanley Park', 'Nikon D7100', '17mm', 'f/8', '8s', 100, '09/11/2015', 1440, 677);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3160.jpg', 'Vancouver', 'Nikon D7100', '10mm', 'f/4', '1/640s', 2000, '09/11/2015', 1440, 1016);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3186.jpg', 'Granville Island', 'Nikon D7100', '10mm', 'f/8', '1/60s', 100, '09/12/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3249.jpg', 'Vancouver Airport', 'Nikon D7100', '20mm', 'f/8', '1/80s', 1000, '09/13/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('vancouver-2015/DSC_3253.jpg', 'Vancouver Airport', 'Nikon D7100', '16mm', 'f/8', '1/125s', 1000, '09/13/2015', 1440, 960);


# Crater lake
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('crater-lake-2015/DSC_2837.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/4', '30s', 64000, '09/05/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('crater-lake-2015/DSC_2840.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/4', '30s', 64000, '09/05/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('crater-lake-2015/DSC_2842.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/8', '30m', 100, '09/05/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('crater-lake-2015/DSC_2905.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/8', '1/250s', 100, '09/06/2015', 1440, 784);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('crater-lake-2015/DSC_2969.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/8', '1/320s', 100, '09/06/2015', 1440, 904);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('crater-lake-2015/DSC_3021.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/8', '1/80s', 1000, '09/06/2015', 1440, 866);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('crater-lake-2015/DSC_3038.jpg', 'Crater Lake', 'Nikon D7100', '10mm', 'f/4', '30s', 6400, '09/06/2015', 1440, 960);


# Caltopia
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('caltopia-2015/DSC_1464.jpg', 'Eureka', 'Nikon D7100', '35mm', 'f/2.8', '1/125s', 500, '05/22/2015', 1440, 844);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('caltopia-2015/DSC_1473.jpg', 'Eureka', 'Nikon D7100', '35mm', 'f/2.8', '1/200s', 500, '05/22/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('caltopia-2015/DSC_2785.jpg', 'Berkeley', 'Nikon D7100', '10mm', 'f/11', '1/500s', 400, '08/23/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('caltopia-2015/DSC_2802.jpg', 'Berkeley', 'Nikon D7100', '10mm', 'f/8', '1/800s', 640, '08/23/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('caltopia-2015/DSC_2816.jpg', 'Berkeley', 'Nikon D7100', '10mm', 'f/8', '1/400s', 640, '08/23/2015', 1440, 960);


# mission peak
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('mission-peak-2015/DSC_2525.jpg', 'Mission Peak', 'Nikon D7100', '12mm', 'f/8', '1/320s', 100, '07/12/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('mission-peak-2015/DSC_2529.jpg', 'Mission Peak', 'Nikon D7100', '10mm', 'f/8', '1/200s', 100, '07/12/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('mission-peak-2015/DSC_2549.jpg', 'Mission Peak', 'Nikon D7100', '10mm', 'f/8', '1/400s', 100, '07/12/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('mission-peak-2015/DSC_2623.jpg', 'Mission Peak', 'Nikon D7100', '20mm', 'f/7.1', '1/125s', 1250, '07/12/2015', 1440, 960);


# LA photos
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1477.jpg', 'I5 Rest Area', 'Nikon D7100', '14mm', 'f/8', '1/125s', 100, '05/23/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1512.jpg', 'Getty Villa', 'Nikon D7100', '16mm', 'f/8', '1/1600s', 500, '05/24/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1523.jpg', 'Santa Monica Seafood', 'Nikon D7100', '35mm', 'f/4', '1/40s', 200, '05/24/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1548.jpg', 'LACMA', 'Nikon D7100', '10mm', 'f/4', '1/8000s', 200, '05/24/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1560.jpg', 'Kang Ho-Dong Baekjeong', 'Nikon D7100', '10mm', 'f/4', '1/40s', 2500, '05/24/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1576.jpg', 'Boiling Point Pasadena', 'Nikon D7100', '35mm', 'f/3.2', '1/50s', 2500, '05/25/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1613.jpg', 'Caltech', 'Nikon D7100', '13mm', 'f/8', '1/640s', 2500, '05/25/2015', 1440, 637);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1626.jpg', 'Beckman Auditorium, Caltech', 'Nikon D7100', '10mm', 'f/8', '1/400s', 800, '05/25/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('la-2015/DSC_1639.jpg', 'Beckman Auditorium, Caltech', 'Nikon D7100', '10mm', 'f/8', '1/200s', 800, '05/25/2015', 1440, 960);


# Napa
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('napa-2015/DSC_1243.jpg', 'Clos Du Val Winery', 'Nikon D7100', '55mm', 'f/2.8', '1/1250s', 100, '04/26/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('napa-2015/DSC_1244.jpg', 'Clos Du Val Winery', 'Nikon D7100', '55mm', 'f/2.8', '1/1250s', 100, '04/26/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('napa-2015/DSC_1252.jpg', 'Clos Du Val Winery', 'Nikon D7100', '55mm', 'f/2.8', '1/1250s', 100, '04/26/2015', 1440, 960);


# Taiwan
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_0993.jpg', 'Taipei', 'Nikon D7100', '10mm', 'f/8', '1/125s', 100, '03/23/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1023.jpg', 'Taroko National Park', 'Nikon D7100', '10mm', 'f/6.3', '1/50s', 2000, '03/24/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1044.jpg', 'Addiction Aquatic Development', 'Nikon D7100', '15mm', 'f/5', '1/50s', 2000, '03/26/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1046.jpg', 'Addiction Aquatic Development', 'Nikon D7100', '10mm', 'f/4', '1/60s', 2500, '03/26/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1050.jpg', 'Addiction Aquatic Development', 'Nikon D7100', '12mm', 'f/4.5', '1/60s', 2500, '03/26/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1051.jpg', 'Addiction Aquatic Development', 'Nikon D7100', '13mm', 'f/4.5', '1/40s', 2500, '03/26/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1066.jpg', 'Chiang Kai-shek Memorial Hall', 'Nikon D7100', '10mm', 'f/8', '1/40s', 160, '03/26/2015', 1440, 789);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1102.jpg', 'Honey Creme Taipei', 'Nikon D7100', '11mm', 'f/4.5', '1/80s', 400, '03/27/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1114.jpg', 'Zhongxiao E Road, Section 4', 'Nikon D7100', '11.5mm', 'f/4.2', '1/40s', 400, '03/27/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1135.jpg', 'Taipei 101', 'Nikon D7100', '10mm', 'f/8', '1/1000s', 500, '03/28/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1182.jpg', 'Din Tai Fung Taipei 101', 'Nikon D7100', '10mm', 'f/6.3', '1/60s', 2000, '03/28/2015', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('taiwan-2015/DSC_1192.jpg', 'Elephant Mountain', 'Nikon D7100', '20mm', 'f/8', '8s', 100, '03/28/2015', 1440, 960);








CREATE TABLE IF NOT EXISTS album_photos(
    id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL
);

CREATE INDEX album_photos_album_idx ON album_photos (album_id);

# vancouver
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 1);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 22);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 23);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 24);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 25);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 26);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 27);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 28);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 29);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 30);
INSERT INTO album_photos (album_id, photo_id) VALUES (1, 31);

# crater lake
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 2);
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 32);
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 33);
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 34);
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 35);
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 36);
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 37);
INSERT INTO album_photos (album_id, photo_id) VALUES (2, 38);

# caltopia
INSERT INTO album_photos (album_id, photo_id) VALUES (3, 3);
INSERT INTO album_photos (album_id, photo_id) VALUES (3, 39);
INSERT INTO album_photos (album_id, photo_id) VALUES (3, 40);
INSERT INTO album_photos (album_id, photo_id) VALUES (3, 41);
INSERT INTO album_photos (album_id, photo_id) VALUES (3, 42);
INSERT INTO album_photos (album_id, photo_id) VALUES (3, 43);

# mission peak
INSERT INTO album_photos (album_id, photo_id) VALUES (4, 4);
INSERT INTO album_photos (album_id, photo_id) VALUES (4, 44);
INSERT INTO album_photos (album_id, photo_id) VALUES (4, 45);
INSERT INTO album_photos (album_id, photo_id) VALUES (4, 46);
INSERT INTO album_photos (album_id, photo_id) VALUES (4, 47);

# LA
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 5);
-- INSERT INTO album_photos (album_id, photo_id) VALUES (5, 6);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 48);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 49);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 50);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 51);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 52);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 53);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 54);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 55);
INSERT INTO album_photos (album_id, photo_id) VALUES (5, 56);

# Napa
INSERT INTO album_photos (album_id, photo_id) VALUES (6, 7);
INSERT INTO album_photos (album_id, photo_id) VALUES (6, 57);
INSERT INTO album_photos (album_id, photo_id) VALUES (6, 58);
INSERT INTO album_photos (album_id, photo_id) VALUES (6, 59);

# Taiwan
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 8);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 60);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 61);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 62);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 63);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 64);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 65);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 66);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 67);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 68);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 69);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 70);
INSERT INTO album_photos (album_id, photo_id) VALUES (7, 71);


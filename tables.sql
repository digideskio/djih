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

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Los Angeles 2015', 'Los Angelos, CA', '05/24/2015', 6, 'travel');

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

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Taiwan 2014', 'Taipei, TW', '09/07/2014', 87, 'travel');



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

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0171.jpg', 'Magnificent Mile', 'Nikon D5100', '10mm', 'f/8', '1/800s', 250, '11/25/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('hong-kong-2014/DSC_0540.jpg', 'Chi Lin Nunnery', 'Nikon D5100', '10mm', 'f/8', '1/400s', 1000, '09/14/2014', 1440, 870);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('san-francisco-2014/DSC_0721.jpg', 'Pier 33', 'Nikon D5100', '10mm', 'f/22', '1/60s', 100, '07/13/2014', 960, 636);


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


# Boston
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('boston-2014/DSC_0415.jpg', 'Tufts University', 'Nikon D7100', '10mm', 'f/8', '1/125s', 100, '12/29/2014', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('boston-2014/DSC_0417.jpg', 'Tisch Library Roof', 'Nikon D7100', '10mm', 'f/8', '1/500s', 100, '12/29/2014', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('boston-2014/DSC_0441.jpg', 'Charles River', 'Nikon D7100', '16mm', 'f/8', '1/200s', 100, '12/29/2014', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('boston-2014/DSC_0447.jpg', 'Boston Museum of Science', 'Nikon D7100', '10mm', 'f/8', '3s', 100, '12/29/2014', 1440, 960);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('boston-2014/DSC_0475.jpg', 'New England Aquarium', 'Nikon D7100', '10mm', 'f/4', '1/60s', 2000, '12/30/2014', 1440, 960);


# Chicago
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0012.jpg', 'Magnificent Mile', 'Nikon D5100', '20mm', 'f/8', '1s', 100, '11/24/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0016.jpg', 'Magnificent Mile', 'Nikon D5100', '14mm', 'f/8', '2s', 100, '11/24/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0027.jpg', 'Magnificent Mile', 'Nikon D5100', '10mm', 'f/4', '1/100s', 800, '11/24/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0030.jpg', 'Magnificent Mile', 'Nikon D5100', '35mm', 'f/1.8', '1/640s', 800, '11/24/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0041.jpg', 'Hancock Observatory', 'Nikon D5100', '10mm', 'f/8', '10s', 100, '11/24/2014', 1440, 698);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0073.jpg', 'Chicago River', 'Nikon D5100', '10mm', 'f/8', '1/1000s', 250, '11/25/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0113.jpg', 'Chicago River', 'Nikon D5100', '10mm', 'f/8', '1/2000s', 250, '11/25/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0151.jpg', 'Trump Tower', 'Nikon D5100', '10mm', 'f/8', '1/1250s', 250, '11/25/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0182.jpg', 'Cloud Gate', 'Nikon D5100', '10mm', 'f/8', '1/400s', 250, '11/25/2014', 1440, 954);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height) VALUES ('chicago-2014/DSC_0193.jpg', 'Cloud Gate', 'Nikon D5100', '10mm', 'f/5', '1/800s', 250, '11/25/2014', 1440, 954);


# Hong Kong
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0384.jpg', 'Cathay Pacific', 'Nikon D5100', '18mm', 'f/8', '1/200s', 1250, '09/13/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0395.jpg', 'Cathay Pacific', 'Nikon D5100', '19mm', 'f/8', '1/1000s', 100, '09/13/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0444.jpg', 'Victoria Peak', 'Nikon D5100', '17mm', 'f/8', '10s', 100, '09/13/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0486.jpg', 'L''Atelier de Joël Robuchon', 'Nikon D5100', '35mm', 'f/4.5', '1/80s', 1600, '09/14/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0503.jpg', 'L''Atelier de Joël Robuchon', 'Nikon D5100', '35mm', 'f/7.1', '1/40s', 1600, '09/14/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0505.jpg', 'L''Atelier de Joël Robuchon', 'Nikon D5100', '35mm', 'f/4', '1/100s', 1600, '09/14/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0517.jpg', 'L''Atelier de Joël Robuchon', 'Nikon D5100', '35mm', 'f/4', '1/50s', 1600, '09/14/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0546.jpg', 'Chi Lin Nunnery', 'Nikon D5100', '10mm', 'f/8', '1/800s', 100, '09/14/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0569.jpg', 'Avenue of the Stars', 'Nikon D5100', '20mm', 'f/8', '1/400s', 100, '09/14/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0600.jpg', 'Avenue of the Stars', 'Nikon D5100', '20mm', 'f/8', '8s', 100, '09/14/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0639.jpg', 'Lung King Heen', 'Nikon D5100', '20mm', 'f/5.6', '1/80s', 100, '09/15/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0642.jpg', 'Lung King Heen', 'Nikon D5100', '20mm', 'f/8', '1/60s', 100, '09/15/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0644.jpg', 'Lung King Heen', 'Nikon D5100', '10mm', 'f/5.6', '1/125s', 100, '09/15/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0644.jpg', 'Lung King Heen', 'Nikon D5100', '10mm', 'f/5.6', '1/125s', 100, '09/15/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0653.jpg', 'Lung King Heen', 'Nikon D5100', '20mm', 'f/8', '1/100s', 100, '09/15/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2014/DSC_0713.jpg', 'Tian Tan Buddha', 'Nikon D5100', '10mm', 'f/8', '1/125s', 100, '09/15/2014', 1440, 954, 'travel');

# Taiwan
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0836.jpg', 'National Taiwan University', 'Nikon D5100', '10mm', 'f/8', '1/125s', 1000, '09/19/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0048.jpg', 'Tainan Tea Shop', 'Nikon D5100', '35mm', 'f/1.8', '1/1000s', 800, '09/07/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0149.jpg', '六千牛肉湯', 'Nikon D5100', '35mm', 'f/4', '1/60s', 1600, '09/07/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0151.jpg', 'Tainan', 'Nikon D5100', '16mm', 'f/5', '1/4000s', 500, '09/07/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0175.jpg', 'Taichung Rice Ball', 'Nikon D5100', '18mm', 'f/5.6', '1/1000s', 1250, '09/09/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0186.jpg', '台中火車站', 'Nikon D5100', '15mm', 'f/7.1', '1/160s', 1250, '09/09/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0198.jpg', '彩虹眷村', 'Nikon D5100', '10mm', 'f/11', '1/60s', 100, '09/09/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0277.jpg', '貓空', 'Nikon D5100', '10mm', 'f/8', '1/320s', 400, '09/12/2014', 1440, 954, 'food');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0307.jpg', '貓空大茶壺茶餐廳', 'Nikon D5100', '10mm', 'f/9', '1/100s', 100, '09/12/2014', 1440, 954, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2014/DSC_0316.jpg', '貓空纜車', 'Nikon D5100', '10mm', 'f/4', '1/50s', 1000, '09/12/2014', 1440, 954, 'travel');













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

# Boston
INSERT INTO album_photos (album_id, photo_id) VALUES (8, 9);
INSERT INTO album_photos (album_id, photo_id) VALUES (8, 72);
INSERT INTO album_photos (album_id, photo_id) VALUES (8, 73);
INSERT INTO album_photos (album_id, photo_id) VALUES (8, 74);
INSERT INTO album_photos (album_id, photo_id) VALUES (8, 75);
INSERT INTO album_photos (album_id, photo_id) VALUES (8, 76);


ALTER TABLE photos ADD COLUMN category TEXT NOT NULL DEFAULT 'travel';
CREATE INDEX photos_category_idx ON photos (category);
UPDATE photos SET category = 'food' WHERE id = 39;
UPDATE photos SET category = 'food' WHERE id = 40;
UPDATE photos SET category = 'food' WHERE id = 50;
UPDATE photos SET category = 'food' WHERE id = 52;
UPDATE photos SET category = 'food' WHERE id = 53;
UPDATE photos SET category = 'food' WHERE id = 57;
UPDATE photos SET category = 'food' WHERE id = 58;
UPDATE photos SET category = 'food' WHERE id = 62;
UPDATE photos SET category = 'food' WHERE id = 63;
UPDATE photos SET category = 'food' WHERE id = 64;
UPDATE photos SET category = 'food' WHERE id = 65;
UPDATE photos SET category = 'food' WHERE id = 67;
UPDATE photos SET category = 'food' WHERE id = 70;


# Chicago
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 10);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 77);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 78);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 79);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 80);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 81);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 82);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 83);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 84);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 85);
INSERT INTO album_photos (album_id, photo_id) VALUES (9, 86);

# Hong Kong
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 11);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 88);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 89);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 90);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 91);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 92);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 93);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 94);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 95);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 96);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 97);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 98);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 99);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 100);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 101);
INSERT INTO album_photos (album_id, photo_id) VALUES (10, 102);

# Taiwan
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 87);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 103);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 104);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 105);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 106);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 107);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 108);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 109);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 110);
INSERT INTO album_photos (album_id, photo_id) VALUES (21, 111);




# SAN FRANCISCO
# cover photo
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 12);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0052.jpg', 'Ghirardelli Square', 'Nikon D5100', '20mm', 'f/22', '1/3s', 100, '07/15/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 112);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0070.jpg', 'Ghirardelli Square', 'Nikon D5100', '10mm', 'f/22', '1/60s', 1000, '07/15/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 113);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0089.jpg', 'Ghirardelli Square', 'Nikon D5100', '15mm', 'f/22', '1/2s', 100, '07/15/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 114);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0113.jpg', 'Alcatraz', 'Nikon D5100', '11mm', 'f/10', '1/250s', 500, '06/22/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 115);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0115.jpg', 'Ghirardelli Square', 'Nikon D5100', '14mm', 'f/22', '3s', 100, '07/16/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 116);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0195.jpg', 'Pier 14', 'Nikon D5100', '11.5mm', 'f/4.2', '1/1000s', 500, '08/10/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 117);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0217.jpg', 'Alcatraz', 'Nikon D5100', '10mm', 'f/10', '4s', 100, '06/22/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 118);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0224.jpg', 'Ocean Beach', 'Nikon D5100', '20mm', 'f/5.6', '1/100s', 500, '06/28/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 119);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0238.jpg', 'Ocean Beach', 'Nikon D5100', '11mm', 'f/11', '4s', 100, '06/29/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 120);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0240.jpg', 'Bay Bridge', 'Nikon D5100', '14mm', 'f/8', '1/25s', 640, '08/10/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 121);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0290.jpg', 'AT&T Park', 'Nikon D5100', '10mm', 'f/8', '1/320s', 1000, '07/02/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 122);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0359.jpg', 'Driven Raceway', 'Nikon D5100', '14mm', 'f/4.8', '1/60s', 1600, '07/04/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 123);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0597.jpg', 'Pebble Beach Crescent City', 'Nikon D5100', '22mm', 'f/10', '1/5s', 100, '07/05/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 124);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0866.jpg', 'Alcatraz', 'Nikon D5100', '16mm', 'f/25', '1s', 100, '07/13/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 125);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0890.jpg', 'Golden Gate Bridge', 'Nikon D5100', '20mm', 'f/32', '2.5s', 100, '07/14/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 126);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2014/DSC_0903.jpg', 'Alcatraz', 'Nikon D5100', '10mm', 'f/18', '15s', 100, '07/14/2014', 1440, 900, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (11, 127);



# FORT FUNSTON ALBUM
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('fort-funston-2015/DSC_0613.jpg', 'Fort Funston', 'Nikon D7100', '10mm', 'f/8', '1/1250s', 1000, '01/11/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (22, 128);

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Fort Funston 2015', 'Fort Funston, CA', '01/11/2015', 128, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('fort-funston-2015/DSC_0627.jpg', 'Fort Funston', 'Nikon D7100', '20mm', 'f/8', '6s', 100, '01/11/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (22, 129);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('fort-funston-2015/DSC_0631.jpg', 'Fort Funston', 'Nikon D7100', '10mm', 'f/8', '10s', 100, '01/11/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (22, 130);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('fort-funston-2015/DSC_0650.jpg', 'Fort Funston', 'Nikon D7100', '10mm', 'f/8', '1/60s', 800, '01/11/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (22, 131);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('fort-funston-2015/DSC_1956.jpg', 'Fort Funston', 'Nikon D7100', '10mm', 'f/8', '1/400s', 100, '06/18/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (22, 132);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('fort-funston-2015/DSC_1960.jpg', 'Fort Funston', 'Nikon D7100', '10mm', 'f/8', '1/400s', 100, '06/18/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (22, 133);



# I280 Vista Point Album
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2081.jpg', 'I-280 Vista Point', 'Nikon D7100', '10mm', 'f/8', '1/125s', 500, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 134);

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('I-280 Vista Point 2015', 'I-280 Vista Point, CA', '07/01/2015', 134, 'travel');

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2076.jpg', 'I-280 Vista Point', 'Nikon D7100', '10mm', 'f/8', '1/50s', 200, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 135);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2079.jpg', 'I-280 Vista Point', 'Nikon D7100', '13mm', 'f/8', '1/80s', 500, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 136);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2084.jpg', 'I-280 Vista Point', 'Nikon D7100', '10mm', 'f/8', '1/80s', 500, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 137);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2085.jpg', 'I-280 Vista Point', 'Nikon D7100', '10mm', 'f/8', '1/100s', 500, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 138);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2088.jpg', 'I-280 Vista Point', 'Nikon D7100', '10mm', 'f/8', '1/125s', 500, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 139);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2096.jpg', 'I-280 Vista Point', 'Nikon D7100', '10mm', 'f/8', '1/125s', 500, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 140);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('280-vista-2015/DSC_2099.jpg', 'I-101', 'Nikon D7100', '10mm', 'f/8', '1/15s', 500, '07/01/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (23, 141);



# Combining NY Aug 2013 and NY Dec 2013 Albums
DELETE FROM albums WHERE id = 13;
UPDATE photos SET filename = 'new-york-2013/1150766_10200575871579630_27331072_o.jpg' WHERE id = 13;
UPDATE photos SET location = 'Brooklyn Bridge' WHERE id = 13;
INSERT INTO album_photos (album_id, photo_id) VALUES (12, 13);

UPDATE photos SET filename  = 'new-york-2013/1116116_10200575878779810_1123777098_o.jpg' WHERE id = 14;
UPDATE photos SET location = 'Brooklyn Bridge' WHERE id = 14;
INSERT INTO album_photos (album_id, photo_id) VALUES (12, 14);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('new-york-2013/1498937_10201323754116226_366263792_o.jpg', 'Katsuhama', 'Nikon D5100', '35mm', 'f/1.8', '1/30s', 1600, '12/26/2013', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (12, 143);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('new-york-2013/1501335_10201323760716391_1186661227_o.jpg', 'Totto Ramen', 'Nikon D5100', '35mm', 'f/1.8', '1/30s', 1600, '12/27/2013', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (12, 144);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('new-york-2013/1502677_10201323760756392_772845047_o.jpg', 'Totto Ramen', 'Nikon D5100', '35mm', 'f/1.8', '1/30s', 1600, '12/27/2013', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (12, 145);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('new-york-2013/1522941_10201326508905094_1395246278_o.jpg', 'Brooklyn Bridge', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 1000, '08/26/2013', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (12, 146);


# Chicago album
UPDATE photos SET location = 'River North' WHERE id = 15;
INSERT INTO album_photos (album_id, photo_id) VALUES (14, 15);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('chicago-2013/977075_10200327796377905_363332958_o.jpg', 'River North', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 500, '07/04/2013', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (14, 147);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('chicago-2013/1014675_10200327803618086_1252044622_o.jpg', 'Millenium Park', 'Nikon D5100', '35mm', 'f/1.8', '1/200s', 500, '07/05/2013', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (14, 148);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('chicago-2013/1040024_10200327808218201_2143424073_o.jpg', 'Millenium Park', 'Nikon D5100', '35mm', 'f/1.8', '1/200s', 500, '07/05/2013', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (14, 149);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('chicago-2013/1048740_10200327800778015_1221320468_o.jpg', 'Millenium Park', 'Nikon D5100', '35mm', 'f/1.8', '1/200s', 500, '07/05/2013', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (14, 150);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('chicago-2013/1064559_10200327798217951_1774218513_o.jpg', 'River North', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 500, '07/04/2013', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (14, 151);


# Hong Kong Album
UPDATE photos SET location = 'Victoria Harbor' WHERE id = 16;
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 16);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/256647_4248448209823_46355845_o.jpg', 'Tsuen Wan', 'Nikon D5100', '35mm', 'f/1.8', '1/200s', 100, '12/07/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 152);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/735874_4248438689585_426255549_o.jpg', 'Victoria Peak', 'Nikon D5100', '35mm', 'f/1.8', '1/400s', 100, '12/08/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 153);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/735987_4248448649834_972572886_o.jpg', 'Mong Kok', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 1000, '12/09/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 154);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/736215_4274825589241_1215565119_o.jpg', 'Tian Tan Buddha', 'Nikon D5100', '35mm', 'f/4', '1/100s', 1000, '12/09/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 155);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/736731_4274821269133_1909324126_o.jpg', 'Victoria Harbor', 'Nikon D5100', '35mm', 'f/4', '1/600s', 800, '12/08/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 156);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/737122_4274820909124_793588435_o.jpg', 'Victoria Harbor', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 1000, '12/08/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 157);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/737309_4248448689835_834812171_o.jpg', 'Mong Kok', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 1000, '12/09/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 158);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hong-kong-2012/740642_4274828229307_1964376032_o.jpg', 'Cafe e Nata Margaret''s', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 1000, '12/09/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (15, 159);


# Taiwan album
UPDATE photos SET location = 'Taipei Zoo' WHERE id = 17;
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 17);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/736139_4243845494758_1209897196_o.jpg', 'San Francisco International Airport', 'Nikon D5100', '35mm', 'f/8', '1/100s', 400, '12/05/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 160);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/736653_4294864090191_1197926873_o.jpg', 'Alishan 阿里山', 'Nikon D5100', '35mm', 'f/4', '1/40s', 1000, '12/11/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 161);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/736755_4243845894768_1906811984_o.jpg', 'Taichung 台中', 'Nikon D5100', '35mm', 'f/1.8', '1/40s', 1600, '12/06/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 162);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/740397_4294857210019_2146226869_o.jpg', 'Alishan 阿里山', 'Nikon D5100', '35mm', 'f/4', '1/60s', 500, '12/11/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 163);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/740835_4315621849122_1727781019_o.jpg', 'Chiang Kai-shek Memorial Hall 中正紀念堂', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 1000, '12/13/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 164);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/741019_4294860010089_1352582894_o.jpg', 'Alishan 阿里山', 'Nikon D5100', '35mm', 'f/4', '1/60s', 500, '12/11/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 165);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/741091_4315633569415_269662649_o.jpg', 'Tao Yuan Airport 台灣桃園國際機場', 'Nikon D5100', '35mm', 'f/1.8', '1/100s', 100, '12/15/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 166);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-2012/741282_4294865570228_441425912_o.jpg', 'Alishan 阿里山', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 1000, '12/11/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (16, 167);


# NYC 2012 album
UPDATE photos SET location = 'High Line' WHERE id = 18;
INSERT INTO album_photos (album_id, photo_id) VALUES (17, 18);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('new-york-2012/277516_3782388278616_1931672317_o.jpg', 'Chelsea Market', 'Nikon D5100', '35mm', 'f/1.8', '1/40s', 1600, '09/01/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (17, 168);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('new-york-2012/472696_3782398398869_18990330_o.jpg', 'Upper West Side', 'Nikon D5100', '35mm', 'f/4', '1/100s', 1000, '09/02/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (17, 169);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('new-york-2012/621635_3782400918932_75727693_o.jpg', 'Columbia University', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 500, '09/02/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (17, 170);

# SF 2012 album
INSERT INTO album_photos (album_id, photo_id) VALUES (18, 19);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2012/285898_3750110351688_1404073795_o.jpg', 'Embarcadero', 'Nikon D5100', '35mm', 'f/1.8', '1/60s', 1000, '08/25/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (18, 171);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2012/289289_3750083471016_176377386_o.jpg', 'Pier 14', 'Nikon D5100', '35mm', 'f/1.8', '1/200s', 100, '08/25/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (18, 172);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('san-francisco-2012/328236_3750077150858_18492577_o.jpg', 'Stanford University', 'Nikon D5100', '35mm', 'f/1.8', '1/200s', 100, '08/25/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (18, 173);

# Newton album
UPDATE photos SET location = 'Newton Center' WHERE id = 21;
UPDATE photos SET filename = 'newton-2012/467672_3049455955766_1500566214_o.jpg' WHERE id = 21;
INSERT INTO album_photos (album_id, photo_id) VALUES (20, 21);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('newton-2012/412853_3049479796362_815065236_o.jpg', 'Blue Asia Cafe', 'Nikon D5100', '25mm', 'f/3.5', '1/60s', 1000, '03/30/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (20, 174);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('newton-2012/415477_3088327167522_1356973675_o.jpg', 'Rez Cafe Tufts University', 'Nikon D5100', '18mm', 'f/3.5', '1/60s', 1000, '03/30/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (20, 175);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('newton-2012/462487_3049489836613_425798520_o.jpg', 'Amelia''s Trattoria', 'Nikon D5100', '18mm', 'f/3.5', '1/40s', 1600, '03/25/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (20, 176);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('newton-2012/471521_3049479236348_1567125905_o.jpg', 'Blue Asia Cafe', 'Nikon D5100', '25mm', 'f/3.5', '1/40s', 1600, '03/30/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (20, 177);


# Inyokern album
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 20);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('inyokern-2012/459164_3081574758716_777474347_o.jpg', 'Hagen Canyon', 'Nikon D5100', '18mm', 'f/3.5', '1/100s', 100, '04/05/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 178);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('inyokern-2012/460505_3216753978112_977781257_o.jpg', 'Inyokern', 'Nikon D5100', '18mm', 'f/3.5', '1/100s', 400, '04/07/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 179);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('inyokern-2012/461083_3354669025902_6768284_o.jpg', 'Ontario Airport', 'Nikon D5100', '18mm', 'f/3.5', '1/200s', 100, '04/05/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 180);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('inyokern-2012/465549_3216755378147_1489417121_o.jpg', 'Inyokern', 'Nikon D5100', '18mm', 'f/3.5', '1/100s', 400, '04/07/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 181);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('inyokern-2012/466414_3081576558761_72081871_o.jpg', 'In-N-Out Barstow', 'Nikon D5100', '18mm', 'f/3.5', '1/60s', 1000, '04/10/2012', 1440, 954, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 182);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('inyokern-2012/471748_3284066420881_280756049_o.jpg', 'Inyokern', 'Nikon D5100', '18mm', 'f/3.5', '1/40s', 1600, '04/07/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 183);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('inyokern-2012/478807_3354690466438_90613596_o.jpg', 'Lake Isabella', 'Nikon D5100', '55mm', 'f/5.5', '1/100s', 1000, '04/10/2012', 1440, 954, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (19, 184);


# Random food album
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('food/DSC_0673.jpg', 'MarketBar Ferry Building', 'Nikon D7100', '10mm', 'f/8', '1/60s', 160, '01/18/2015', 1440, 960, 'food');


# Sacramento 2015 album
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('sacramento-2015/DSC_3446.jpg', 'Sacramento', 'Nikon D7100', '10mm', 'f/8', '1/160s', 400, '11/26/2015', 1440, 707, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Sacramento 2015', 'Sacramento, CA', '11/24/2015', 185, 'travel');

INSERT INTO album_photos (album_id, photo_id) VALUES (24, 185);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('sacramento-2015/DSC_3451.jpg', 'Sacramento', 'Nikon D7100', '10mm', 'f/8', '1/60s', 100, '11/26/2015', 1440, 707, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (24, 186);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('sacramento-2015/DSC_3471.jpg', 'State Capitol Building', 'Nikon D7100', '20mm', 'f/8', '1/1250s', 1250, '11/27/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (24, 187);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('sacramento-2015/DSC_3478.jpg', 'State Capitol Building', 'Nikon D7100', '20mm', 'f/8', '1/1000s', 1250, '11/27/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (24, 188);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('sacramento-2015/DSC_3505.jpg', 'Sacramento River Dock', 'Nikon D7100', '10mm', 'f/8', '3s', 100, '11/27/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (24, 189);


# LA Xmas 2015 album
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3629.jpg', 'USC School of Cinematic Arts', 'Nikon D7100', '10mm', 'f/8', '1/160s', 100, '12/24/2015', 1440, 960, 'travel');

INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Los Angeles Christmas 2015', 'Los Angeles, CA', '12/23/2015', 190, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 190);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3534.jpg', 'I-5 Rest Area', 'Nikon D7100', '20mm', 'f/8', '1/2000s', 1000, '12/23/2015', 1440, 854, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 191);

# maybe delete
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3545.jpg', 'Microsoft Square', 'Nikon D7100', '10mm', 'f/8', '1/400s', 125, '12/24/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 192);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3552.jpg', 'Microsoft Square', 'Nikon D7100', '10mm', 'f/8', '1/320s', 125, '12/24/2015', 1440, 813, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 193);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3575.jpg', 'University of Southern California', 'Nikon D7100', '10mm', 'f/8', '1/400s', 125, '12/24/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 194);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3586.jpg', 'University of Southern California', 'Nikon D7100', '15mm', 'f/8', '1/160s', 100, '12/24/2015', 1440, 825, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 195);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3599.jpg', 'University of Southern California', 'Nikon D7100', '10mm', 'f/8', '1/200s', 100, '12/24/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 196);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3607.jpg', 'University of Southern California', 'Nikon D7100', '10mm', 'f/8', '1/160s', 100, '12/24/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 197);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3614.jpg', 'University of Southern California', 'Nikon D7100', '10mm', 'f/8', '1/160s', 100, '12/24/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 198);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3625.jpg', 'USC School of Cinematic Arts', 'Nikon D7100', '10mm', 'f/8', '1/100s', 100, '12/24/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 199);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3633.jpg', 'USC School of Cinematic Arts', 'Nikon D7100', '10mm', 'f/8', '1/640s', 100, '12/24/2015', 1440, 921, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 200);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3635.jpg', 'USC School of Cinematic Arts', 'Nikon D7100', '12mm', 'f/8', '1/100s', 200, '12/24/2015', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 201);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3662.jpg', 'Shin-Sen-Gumi Hakata Ramen Little Tokyo', 'Nikon D7100', '20mm', 'f/5.6', '1/100s', 10159, '12/24/2015', 1440, 853, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 202);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3666.jpg', 'Shin-Sen-Gumi Hakata Ramen Little Tokyo', 'Nikon D7100', '14mm', 'f/4.8', '1/200s', 10159, '12/24/2015', 1440, 1008, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 203);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3676.jpg', 'Gen Korean BBQ House Torrance', 'Nikon D7100', '10mm', 'f/4', '1/100s', 2500, '12/25/2015', 1440, 810, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 204);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3698.jpg', 'Terranea', 'Nikon D7100', '10mm', 'f/8', '1/800s', 1000, '12/25/2015', 1440, 746, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 205);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3721.jpg', 'Terranea', 'Nikon D7100', '10mm', 'f/8', '1/6s', 100, '12/25/2015', 1440, 820, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 206);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3732.jpg', 'Terranea', 'Nikon D7100', '20mm', 'f/8', '1/4s', 100, '12/25/2015', 1440, 865, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 207);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3740.jpg', 'Trump National Golf Club', 'Nikon D7100', '10mm', 'f/8', '10s', 100, '12/25/2015', 1440, 814, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 208);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3744.jpg', 'Pasadena City Hall', 'Nikon D7100', '20mm', 'f/8', '4s', 100, '12/25/2015', 1440, 724, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 209);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3750.jpg', 'Boiling Point Arcadia', 'Nikon D7100', '14mm', 'f/4.8', '1/50s', 2500, '12/26/2015', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 210);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3756.jpg', 'Lady M', 'Nikon D7100', '20mm', 'f/5.6', '1/500s', 2500, '12/26/2015', 1440, 849, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 211);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('la-xmas-2015/DSC_3763.jpg', 'Lady M', 'Nikon D7100', '20mm', 'f/5.6', '1/400s', 2500, '12/26/2015', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (25, 212);


# Tahoe MLK 2016 photos
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('tahoe-mlk-2016/DSC_3844.jpg', 'Tahoe City Marina', 'Nikon D7100', '10mm', 'f/8', '1/640s', 100, '1/18/2016', 1440, 960, 'travel');
INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Lake Tahoe MLK 2016', 'Lake Tahoe, CA', '1/18/2016', 213, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (26, 213);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('tahoe-mlk-2016/DSC_3846.jpg', 'Tahoe City Marina', 'Nikon D7100', '10mm', 'f/8', '1/400s', 100, '1/18/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (26, 214);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('tahoe-mlk-2016/DSC_3848.jpg', 'Tahoe City Marina', 'Nikon D7100', '10mm', 'f/8', '1/400s', 100, '1/18/2016', 1440, 651, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (26, 215);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('tahoe-mlk-2016/DSC_3859.jpg', 'Tahoe City Marina', 'Nikon D7100', '10mm', 'f/8', '1/400s', 100, '1/18/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (26, 216);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('tahoe-mlk-2016/DSC_3861.jpg', 'Tahoe City Marina', 'Nikon D7100', '10mm', 'f/8', '1/320s', 100, '1/18/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (26, 217);


# HK Feb 2016 photos
INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4122.jpg', 'Victoria Peak, HK', 'Nikon D7100', '10mm', 'f/8', '1.3s', 320, '2/20/2016', 1440, 664, 'travel');
INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Hong Kong 2016', 'Hong Kong, PRC', '2/20/2016', 218, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 218);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4062.jpg', 'Victoria Peak, HK', 'Nikon D7100', '10mm', 'f/8', '1/125s', 320, '2/20/2016', 1440, 737, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 219);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4091.jpg', 'Victoria Peak, HK', 'Nikon D7100', '15mm', 'f/9', '61s', 320, '2/20/2016', 1440, 814, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 220);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4107.jpg', 'Victoria Peak, HK', 'Nikon D7100', '35mm', 'f/8', '1/2s', 320, '2/20/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 221);

INSERT INTO photos (filename, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4129.jpg', 'Mong Kok, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/400s', 800, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 222);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4141.jpg', 'Mango Mochi', 'Mong Kok, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/400s', 800, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 223);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4148.jpg', '烤魷魚 (Grilled Octopus)', 'Mong Kok, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/640s', 800, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 224);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4161.jpg', 'Bread Platter', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/100s', 1600, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 225);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4164.jpg', 'Fois Gras Egg Custard', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/40s', 1600, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 226);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4170.jpg', 'Cheese Soufflé', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/60s', 1600, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 227);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4172.jpg', 'Sea Bream Carpaccio with Uni', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/400s', 1600, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 228);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4174.jpg', 'Sea bream carpaccio with uni', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/1.8', '1/250s', 1600, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 229);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4179.jpg', 'Maine Lobster Spaghetti', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/4', '1/200s', 1600, '2/21/2016', 1440, 1001, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 230);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4181.jpg', 'Slow Cooked Lamb', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/4', '1/100s', 2500, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 231);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4190.jpg', 'Petit Fours', 'L''Atelier de Joël Robuchon, HK', 'Nikon D7100', '35mm', 'f/4', '1/80s', 2500, '2/21/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 232);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4231.jpg', 'A Symphony of Lights', 'Avenue of Stars, HK', 'Nikon D7100', '20mm', 'f/8', '181s', 320, '2/22/2016', 1440, 586, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 233);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('hk-feb-2016/DSC_4253.jpg', 'A Symphony of Lights', 'Avenue of Stars, HK', 'Nikon D7100', '20mm', 'f/25', '8s', 320, '2/22/2016', 1440, 595, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (27, 234);


# Taiwan Feb 2016 photos
INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4290.jpg', 'View of the Sea', 'Jiufen (九份), Taiwan', 'Nikon D7100', '10mm', 'f/8', '1/60s', 1000, '2/24/2016', 1440, 795, 'travel');
INSERT INTO albums (name, location, date, cover_photo_id, category) VALUES ('Taiwan 2016', 'Taipei, Taiwan', '2/23/2016', 235, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 235);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4307.jpg', 'Souvenir Shop (紀念品店)', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '35mm', 'f/2.5', '1/500s', 1600, '2/24/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 236);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4311.jpg', 'Grilled Snails (烤海螺)', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '35mm', 'f/4', '1/320s', 1600, '2/24/2016', 1440, 818, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 237);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4315.jpg', 'Taiwanese Meatball (肉丸)', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '35mm', 'f/4', '1/50s', 1600, '2/24/2016', 1440, 874, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 238);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4317.jpg', 'Stuffed Meatball Soup (五味肉丸湯)', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '35mm', 'f/4', '1/100s', 1600, '2/24/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 239);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4322.jpg', 'Jiufen Vista Point', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '13mm', 'f/8', '1/100s', 1600, '2/24/2016', 1440, 831, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 240);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4330.jpg', 'Afternoon Tea (下午茶)', 'Jiufen Teahouse (九份茶坊), Taiwan', 'Nikon D7100', '35mm', 'f/1.8', '1/120s', 2500, '2/24/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 241);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4366.jpg', 'Jiufen Old Street Old Street (九份老街)', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '12mm', 'f/8', '1s', 100, '2/24/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 242);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4371.jpg', 'Colorful Souvenir Shop', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '10mm', 'f/8', '1s', 100, '2/24/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 243);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4387.jpg', 'Taiwanese Sausage (台灣香腸)', 'Jiufen Old Street (九份老街), Taiwan', 'Nikon D7100', '35mm', 'f/3.2', '1/125s', 640, '2/24/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 244);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4419.jpg', 'Omakase', 'Addiction Aquatic Development (上引水產), Taiwan', 'Nikon D7100', '35mm', 'f/4.5', '1/40s', 2500, '2/25/2016', 1440, 912, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 245);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4454.jpg', 'Shopping District', 'ATT 4 Fun, Taiwan', 'Nikon D7100', '20mm', 'f/10', '2s', 100, '2/25/2016', 1440, 960, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 246);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4460.jpg', 'Mixed Berry Danish Tart', '201 Cafe Restaurant, ATT 4 Fun, Taiwan', 'Nikon D7100', '35mm', 'f/4', '1/50s', 1600, '2/25/2016', 1440, 913, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 247);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4467.jpg', 'Taiwanese Beef Noodle Soup (牛肉麵)', '永康牛肉麵, Taiwan', 'Nikon D7100', '35mm', 'f/3.5', '1/125s', 1600, '2/25/2016', 1440, 964, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 248);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4471.jpg', 'Mango Ice (芒果冰)', 'Smoothie House (思慕昔), Taiwan', 'Nikon D7100', '35mm', 'f/6.3', '1/40s', 1600, '2/25/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 249);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4477.jpg', '抓餅', '天津蔥抓餅, Taiwan', 'Nikon D7100', '35mm', 'f/1.8', '1/800s', 1600, '2/25/2016', 1440, 960, 'food');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 250);

INSERT INTO photos (filename, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES ('taiwan-feb-2016/DSC_4526.jpg', 'Chang Kai Shek Memorial', '中正紀念堂, Taiwan', 'Nikon D7100', '10mm', 'f/8', '1/200s', 1000, '2/25/2016', 1440, 730, 'travel');
INSERT INTO album_photos (album_id, photo_id) VALUES (28, 251);
import csv
import os
import psycopg2
import re
from dotenv import load_dotenv
from os.path import join, dirname

dotenv_path = join(dirname(__file__), '.env')
load_dotenv(dotenv_path)


DATA_FILENAME = 'data/tables.csv'

# PHOTO_FILENAME_REGEX = 'DSC_[0-9]+.jpg'
PHOTO_FILENAME_REGEX = '/[0-9A-z]*.jpg'

CREATE_ALBUMS = 'CREATE TABLE IF NOT EXISTS test_albums(id SERIAL PRIMARY KEY, name TEXT, location TEXT NOT NULL, date DATE NOT NULL, cover_photo_id INTEGER, category TEXT NOT NULL);'
CREATE_ALBUMS_INDEX = 'CREATE INDEX test_albums_category_idx ON test_albums (category);'
CREATE_PHOTOS = 'CREATE TABLE IF NOT EXISTS test_photos(id SERIAL PRIMARY KEY, filename TEXT NOT NULL, dropbox_url TEXT, title TEXT, location TEXT, camera TEXT, focal_length TEXT, aperture TEXT, shutter_speed TEXT, iso INTEGER, date_taken DATE, width INTEGER, height INTEGER, category TEXT);'
CREATE_PHOTOS_INDEX = 'CREATE INDEX test_photos_category_idx ON test_photos (category);'
CREATE_ALBUM_PHOTOS = 'CREATE TABLE IF NOT EXISTS test_album_photos(id SERIAL PRIMARY KEY, album_id INTEGER NOT NULL, photo_id INTEGER NOT NULL);'
CREATE_ALBUM_PHOTOS_INDEX = 'CREATE INDEX test_album_photos_album_idx ON test_album_photos (album_id);'

INSERT_ALBUM = 'INSERT INTO test_albums (id, name, location, date, category) VALUES (%s, %s, %s, %s, %s);'
INSERT_PHOTO = 'INSERT INTO test_photos (id, filename, dropbox_url, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height, category) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);'
INSERT_ALBUM_PHOTO = 'INSERT INTO test_album_photos (album_id, photo_id) VALUES (%s, %s);'
SET_COVER_PHOTO = 'UPDATE test_albums SET cover_photo_id = %s WHERE id = %s;'


def resetDB():
    def dropTable(cursor, table):
        cursor.execute('DROP TABLE IF EXISTS %s;' % table)

    with psycopg2.connect(os.environ.get('DATABASE_URL')) as conn:
        with conn.cursor() as cursor:
            print 'Dropping Tables'
            dropTable(cursor, 'test_albums')
            dropTable(cursor, 'test_photos')
            dropTable(cursor, 'test_album_photos')

            print 'Creating Tables'
            cursor.execute(CREATE_ALBUMS)
            cursor.execute(CREATE_ALBUMS_INDEX)
            cursor.execute(CREATE_PHOTOS)
            cursor.execute(CREATE_PHOTOS_INDEX)
            cursor.execute(CREATE_ALBUM_PHOTOS)
            cursor.execute(CREATE_ALBUM_PHOTOS_INDEX)


def validateFilenames(filename, dropbox_url):
    if not filename or not dropbox_url:
        return False

    filename_match = re.search(PHOTO_FILENAME_REGEX, filename)
    if not filename_match:
        return False

    dropbox_match = re.search(PHOTO_FILENAME_REGEX, dropbox_url)
    if not dropbox_match:
        return False

    if dropbox_url[0:2] != 's/' or dropbox_url[-4:] != '.jpg':
        return False

    return filename_match.group(0) == dropbox_match.group(0)


def loadData(data_filename):

    album_id = 0
    photo_id = 0

    with psycopg2.connect(os.environ.get('DATABASE_URL')) as conn, conn.cursor() as cursor, open(DATA_FILENAME, 'r') as data_file:
        data = csv.reader(data_file, quotechar="'", delimiter=',', quoting=csv.QUOTE_ALL, skipinitialspace=True)
        for entry in data:

            # check for next album
            if 'album' == entry[0]:

                name, location, date, category = entry[1:5]
                print 'Loading album: %s' % name

                album_id += 1
                cursor.execute(INSERT_ALBUM, (album_id, name, location, date, category))


            # process photo
            else:
                if len(entry) < 13:
                    print 'Invalid entry: %s' % str(entry)
                    continue

                try:
                    title, filename, dropbox_url, location, camera, focal_length, aperture, shutter_speed, iso, date, width, height, category = entry[:13]
                    if not validateFilenames(filename, dropbox_url):
                        print 'Filename %s does not match Dropbox url %s' % (filename, dropbox_url)
                        continue
                    photo_id += 1
                    cursor.execute(INSERT_PHOTO, (photo_id, filename, dropbox_url, title, location, camera, focal_length, aperture, shutter_speed, int(iso), date, int(width), int(height), category))
                except Exception as e:
                    print 'Error parsing entry %s: %s' % (str(entry), e)
                    continue

                # add photo to album
                cursor.execute(INSERT_ALBUM_PHOTO, (album_id, photo_id))

                # set cover photo
                if len(entry) == 14 and entry[13] == 'cover':
                    cursor.execute(SET_COVER_PHOTO, (photo_id, album_id))



if __name__ == '__main__':
    resetDB()
    loadData(DATA_FILENAME)
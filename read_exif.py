import dimensions
import exifread
import os
from datetime import datetime

PATH = '/Users/danieljih/Dropbox/Photos/djih/nyc-2016'
DEFAULT_LOCATION = 'New York, NY'


def isEmptyString(string):
    return string is None or string == ''


def prompt(variable_name, default=None):
    value = None
    while True:
        value = raw_input(variable_name)
        if not isEmptyString(value):
            return value
        if not isEmptyString(default):
            return default


def fractionToFloat(fraction):
    if '/' not in fraction:
        return fraction
    num, den = fraction.split('/')
    return float(num)/float(den)


def getImagesAtPath(path):
    images = []
    for file in os.listdir(path):
        if file.endswith('.jpg'):
            images.append(os.path.join(path, file))
    return images


def readExifForImages(images):
    data = []

    for image_path in images:
        print image_path
        with open(image_path, 'rb') as image:
            tags = exifread.process_file(image, details=False)
            
            
            # title, filename, dropbox_url, location, camera, focal_length, aperture, shutter_speed, iso, date, width, height, category = entry[:13]
            # title - prompt
            title = prompt('Title: ')

            # filename - parse
            file_parts = image_path.split('/')
            filename = os.path.join(file_parts[-2], file_parts[-1])

            # dropbox_url - prompt
            dropbox_url = prompt('Dropbox URL: ')[24:-5]

            # location - prompt
            location = prompt('Location or ("' + DEFAULT_LOCATION + '"): ', DEFAULT_LOCATION)

            # camera
            camera = str(tags['Image Model']).title()

            # focal_length
            focal_length = str(tags['EXIF FocalLength']) + 'mm'

            # aperture
            aperture = 'f/' + str(fractionToFloat(str(tags['EXIF FNumber'])))

            # shutter_speed
            shutter_speed = str(tags['EXIF ExposureTime']) + 's'

            # iso
            iso = int(str(tags['EXIF ISOSpeedRatings']))

            # date
            date = str(datetime.strptime(str(tags['Image DateTime']), '%Y:%m:%d %H:%M:%S').date())

            # width + height
            width, height, _, _ = dimensions.dimensions(image_path)

            # category f/t
            category = 'food' if prompt('Category (f/t): ') == 'f' else 'travel'

        value = (title, filename, dropbox_url, location, camera, focal_length, aperture, shutter_speed, iso, date, width, height, category)

        data.append(value)
            
    return data









if __name__ == '__main__':
    images = getImagesAtPath(PATH)
    data = readExifForImages(images)
    import ipdb; ipdb.set_trace()
    for d in data:
        print d

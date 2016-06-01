var food_albums = []; // [1, 29];

var isValidAlbum = function(id) {
    return (id >= 1 && id <= 31 && food_albums.indexOf(id) == -1);
}

var isValidPhoto = function(id) {
    return (id >= 1 && id <= 282);
}

// min inclusive, max exclusive
var randomInt = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}


module.exports = {
    isValidAlbum: isValidAlbum,
    isValidPhoto: isValidPhoto,
    randomInt: randomInt
};
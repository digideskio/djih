/**
*@function gcd (aka Euclid's algorithm)
*@purpose returns the greatest common factor between two numbers;
*/
function gcd(a, b) {
    return (b) ? gcd(b, a % b) : a;
}
/**
*@function dec2Frac
*@purpose returns a decimal as a fraction.
*/
var dec2Frac = function ( num ) {
    var top = num.toString().replace(/\d+[.]/, '');
    var bot = Math.pow(10, top.length);
    if (num > 1) {
        top = +top + Math.floor(num) * bot;
    }
    var x = gcd(top, bot);
    return (top / x) + "/" + (bot / x);
};
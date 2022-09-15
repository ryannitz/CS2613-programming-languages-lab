/**
 * Step 10-1
 * @param {*} n 
 * @returns 
 */
function factorial(n) {
    if (n < 0) {
        return "Positive integer required";
    }
    if (n <= 1) {
        return n;
    }
    return n * factorial(n - 1);
}
module.exports.factorial = factorial;


/**
 * Step 10-2
 * @returns 
 */
function cachedFactorial() {
    var map = {};

    function innerFactorial(n) {
        if (n < 0) {
            return "Positive integer required";
        }
        if (n <= 1) {
            return n;
        }
        //console.log(Object.keys(map).length);
        if (n in map) {
            console.log("Cache used");
            //console.log(map[n]);
            //mapUsed = true; // don't need global var because once we hit cache, we exit. So we can just print it once
            return map[n];
        }
        var nVal = n * innerFactorial(n - 1);
        map[n] = nVal;
        return nVal;
    }
    return innerFactorial;
}
module.exports.cachedFactorial = cachedFactorial;

// var innerFactorial = cachedFactorial();
// console.log(innerFactorial(5));
// console.log(innerFactorial(6));
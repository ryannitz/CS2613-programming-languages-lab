/**
 * Step 8-1
 * @param {*} start 
 * @param {*} end 
 * @param {*} step 
 * @returns 
 */
const range = (start, end, step = (1 || step)) => {
    let arr = [];
    if (start == end) {
        arr.push(start);
        return arr;
    }
    if (start < end && step >= 1) {
        for (var i = start; i <= end; i += step) {
            arr.push(i);
        }
    }
    if (start > end && step <= 1) {
        for (var i = start; i >= end; i -= Math.abs(step)) {
            arr.push(i);
        }
    }
    return arr;
};
module.exports.range = range;

/**
 * Step 8-2
 * @param {*} arr 
 * @returns 
 */
const sum = (arr) => {
    var sum = 0;
    if (arr == null || arr == undefined || !Array.isArray(arr)) {
        return "Invlaid argument type given.";
    }
    for (var i = 0; i < arr.length; i++) {
        sum += arr[i];
    }
    return sum;
}
module.exports.sum = sum;

//console.log(range(1, 5, -2));
// console.log(range(5, 1));
// console.log(range(5, 5));
// console.log(range(20, 10));
function manipulate(arr, val) {
    return arr.map((x) => x + val);
}

const adjustArray = () => {
    return function(val) {
        return val;
    }
}
console.log([1, 2, 3, 4]);
console.log(manipulate([1, 2, 3, 4], 5));


inner = adjustArray();
console.log(inner(5));
/**
 * STEP 9 Higher Order Functions
 */

//map
function square(n) {
    return Math.pow(n, 2);
}
console.log(square(2)); //should print 4; It does:)

const nums = [2, 4, 6, 8];
const result = nums.map(square);
console.log(result);

//filter
const dog = "dog";

function isDog(animal) {
    return animal.species == dog
}

var animals = [
    { name: "Pluto", species: dog },
    { name: "Garf", species: "Cat" },
    { name: "Courage", species: dog },
    { name: "George", species: "Monkey" },
    { name: "Titanic", species: "Boat" },
];

//var result = animals.filter(isDog);
//console.log(result); //this works but integrated environment spits out: No debugger available, can not send 'variables'

// higher order
function counter() {
    let count = 0;

    function innerCounter() {
        console.log(`Current count: ${count}`);
        count++;
    }
    return innerCounter;
}

var myCounter = counter();
myCounter();
myCounter();
myCounter();
myCounter();
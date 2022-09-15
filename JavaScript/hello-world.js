/*
    Step 2 Test your set-up... Back to Hello WOrld
*/
var msg = "hello World";
console.log(msg);

/*
    Step 3 Evaluate Some Expressions
*/
console.log("STEP 3 -------------------------");
//(* (+ 1 2 3) 7) 
console.log((1 + 2 + 3) * 7);
//(< 41 (* 6 7)) 
console.log(41 < (6 * 7));
//(equal? (* (+ 1 2 3) 7) 42) 
console.log((1 + 2 + 3) * 7 == 42);
//(equal? "Spongebob" "Squarepants")
console.log("Spongebob" == "Squarepants");
//(and (equal? (* 6 7) 42) (equal? "Spongebob" "Squarepants")) 
console.log((6 * 7 == 42) && ("Spongebob" == "Squarepants"));
//(equal? 42 (if (< 3 5) (* 6 7) "turnip")) 
console.log(42 == ((3 < 5) ? (6 * 7) : "turnip"));
// (or #t (/ 1 0)) 
console.log(true || 0 / 1);
// (and #f (/ 1 0))
console.log(false && 0 / 1);




/*
    Step 4 Equality and Type Coercion
*/
console.log("STEP 4 -------------------------");
console.log("" + 1);
console.log(x = "");
console.log(x++);
console.log(42 + 'is a big number');
console.log("" == 0);
console.log(false == 0);
console.log(false == undefined);
console.log(undefined == null);
console.log(undefined == undefined);
if (undefined) { console.log("truthy") } else { console.log("falsey") }
console.log(NaN == undefined);
console.log(NaN == NaN);
console.log("" === 0);
console.log(false === 0);
console.log("" === 0);
console.log(false === undefined);
console.log(undefined === null);
console.log(undefined === undefined);

for (let n = 1; n <= 100; n++) {
    let output = "";
    if (n % 3 == 0) output += "Fizz";
    if (n % 5 == 0) output += "Buzz";
    console.log(output || n);
}


/*
    Step 5 Fucntions Basics
 */

//console.log(square1(2)); // Uncaught ReferenceError: Cannot access 'square1' before initialization
const square1 = function(x) {
    return x * x;
}
console.log(square1(2)); //good
console.log(square1(2, 3, 4)); //Only takes the first argument because that's what the function is asking for (1 argument)

const square2 = (x) => {
    return x * x;
}
console.log(square2(2));

function square3(x) {
    if (x == undefined) {
        x = 2;
    }
    return x * x;
}
console.log(square3(2));
console.log(square3()); //calling this will make x undefined. Good thing we check for that and have a default value



function listMyPets(owner, ...pets) {
    console.log(`${owner} has these pets:`);
    for (let i = 0; i < pets.length; i++) {
        console.log(`${pets[i]}`);
    }
}
listMyPets("Ryan", "cat1", "cat2", "cat3");


/*
    Step 6 Functions as Values
 */
/**
 * STEP 11
 */
let owen = {
    lastName: "Parker",
    firstName: "Owen",
    age: 17
};
for (key in owen) {
    console.log(key + ': ' + owen[key]);
}

/******************/

let owen2 = {
    lastName: "Parker",
    firstName: "Owen",
    age: 17,
    isAdult: function() {
        return this.age >= 18;
    }
};
for (key in owen2) {
    if (typeof owen2[key] !== 'function') {
        console.log(key + ': ' + owen2[key]);
    }
}
console.log(owen2.isAdult);
console.log(owen2.isAdult());

/******************/

function Person(lastName, firstName, age) {
    this.lastName = lastName;
    this.firstName = firstName;
    this.age = age;
    this.isAdult = function() {
        return this.age > 18;
    }
}
console.log(Person())
const owen3 = new Person("Parker", "Owen3", 17);
console.log(owen3.isAdult());


/**
 * STEP 12 Prototyping and inheritance 
 */

function Person2(lastname, firstname, age) {
    this.lastName = lastname;
    this.firstName = firstname;
    this.age = age;
}
Person2.prototype.fullname = function() {
    return `${this.firstName}, ${this.lastName}`;
}
Person2.prototype.isAdult = function() {
    return this.age > 18;
}

const person2 = new Person2("Robot", "BeepBoop", 19);
console.log(person2.fullname());
console.log(person2.isAdult());

/******************/

//included enrolledCourses as argument in case someone wants to create a student with predefined enrolled courses
function Student(studentId, enrolledCourses, firstName, lastName, age) {
    this.studentId = studentId;
    this.enrolledCourses = enrolledCourses;
    Person2.call(this, firstName, lastName, age);
}
Student.prototype = Object.create(Person2.prototype);
Student.prototype.constructor = Student;

Student.prototype.enrollIn = function(courseName) {
    this.enrolledCourses.push(courseName);
}

const student = new Student(1, [], "FirstName", "LastName", 17);
student.enrollIn("Course1");
student.enrollIn("Course2");
student.enrollIn("Course3");
for (key in student) {
    if (typeof student[key] !== 'function') {
        console.log(key + ': ' + student[key]);
    }
}
console.log(student.isAdult());


const student2 = new Student(2, [], "st1", "lname1", 18);
student2.enrollIn("Course11");
student2.enrollIn("Course21");
student2.enrollIn("Course31");
for (key in student2) {
    if (typeof student2[key] !== 'function') {
        console.log(key + ': ' + student2[key]);
    }
}
console.log(student2.isAdult());


const student3 = new Student(3, [], "bob", "bobby", 19);
student3.enrollIn("Course12");
student3.enrollIn("Course22");
student3.enrollIn("Course33");
for (key in student3) {
    if (typeof student3[key] !== 'function') {
        console.log(key + ': ' + student3[key]);
    }
}
console.log(student3.isAdult());
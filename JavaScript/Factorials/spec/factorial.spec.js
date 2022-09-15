var factorial = require("../my-factorial.js").factorial;

describe("factorial with input of", () => {

    const negativeMessage = "Positive integer required";

    it("0 should return 0", () => {
        expect(factorial(0)).toEqual(0);
    });
    it("1 should return 1", () => {
        expect(factorial(1)).toEqual(1);
    });
    it("5 should return 120", () => {
        expect(factorial(5)).toEqual(120);
    });
    it("-5 should return the correct error message", () => {
        expect(factorial(-5)).toEqual(negativeMessage);
    });
    it("null should return null", () => {
        expect(factorial(null)).toEqual(null);
    });
});
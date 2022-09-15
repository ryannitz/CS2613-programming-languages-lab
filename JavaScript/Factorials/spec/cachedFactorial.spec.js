var cachedFactorial = require("../my-factorial.js").cachedFactorial;

describe("cachedFactorial with input of", () => {

    const negativeMessage = "Positive integer required";

    var innerFactorial;
    beforeAll(() => {
        innerFactorial = cachedFactorial();
    });

    it("0 should return 0", () => {
        expect(innerFactorial(0)).toEqual(0)
    });
    it("1 should return 1", () => {
        expect(innerFactorial(1)).toEqual(1)
    });
    it("5 should return 120", () => {
        expect(innerFactorial(5)).toEqual(120)
    });
    it("-5 should return the correct error message", () => {
        expect(innerFactorial(-5)).toEqual(negativeMessage)
    });
    it("null should return null", () => {
        expect(innerFactorial(null)).toEqual(null)
    });
});
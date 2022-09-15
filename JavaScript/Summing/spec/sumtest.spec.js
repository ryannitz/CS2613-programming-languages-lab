var range = require("../my-sums.js").range;
var sum = require("../my-sums.js").sum;

describe("sum with invalid argument", () => {
    it("should return proper message when no arguments are provided", () => {
        expect(sum()).toEqual("Invlaid argument type given.");
    });
    it("should return proper NaN when wrong type is provided", () => {
        expect(sum(1)).toEqual("Invlaid argument type given.");
    });
    it("should return proper message when undefined value is provided", () => {
        var fail;
        expect(sum(fail)).toEqual("Invlaid argument type given.");
    });
});

describe("sum with valid argument", function() {
    it("should be be correct when array has length 1", function() {
        expect(sum([54])).toEqual(54);
    });
    it("should be be correct when array is large", function() {
        expect(sum(range(1, 100))).toEqual(5050);
    });
    it("should be 0 when array is empty", function() {
        expect(sum([])).toEqual(0)
    })
});
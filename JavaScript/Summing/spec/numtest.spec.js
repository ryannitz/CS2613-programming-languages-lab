var range = require("../my-sums.js").range;

describe("range with default step", () => {
    it("should increment when start<end", () => {
        expect(range(2, 5)).toEqual([2, 3, 4, 5])
    });
});

describe("range with default step", function() {
    it("should decrement when start>end", function() {
        expect(range(5, 2)).toEqual([5, 4, 3, 2]);
    });
    it("should be single when start=end", function() {
        expect(range(2, 2)).toEqual([2]);
    });
    it("should be multiple when start<end", function() {
        expect(range(2, 5)).toEqual([2, 3, 4, 5])
    })
});
describe("range with specified step", function() {
    it("should be empty for step increment when start>end", function() {
        expect(range(10, 1, 2)).toEqual([]);
    });
    it("should be empty for step decrement when start<end", function() {
        expect(range(1, 10, -2)).toEqual([]);
    });
    it("should be single when step>end-start", function() {
        expect(range(2, 4, 3)).toEqual([2]);
    });
    it("should be multiple when inc |step|<|end-start|", function() {
        expect(range(1, 10, 2)).toEqual([1, 3, 5, 7, 9])
    });
    it("should be multiple when dec |step|<|end-start|", function() {
        expect(range(10, 1, -2)).toEqual([10, 8, 6, 4, 2])
    });
});
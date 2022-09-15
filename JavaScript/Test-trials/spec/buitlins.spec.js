/**
 * This test runs with both 'npx jasmine' or 'npm test', as defined in package.json
 */

describe("identity", function() {
    it("1 === 1", function() {
        expect(1).toBe(1);
    });

    it("null === null", function() {
        expect(null).toBe(null);
    })
});

describe("arithmetic", function() {
    it("1 + 1 === 2", function() {
        expect(1 + 1).toBe(2);
    });

    it("6 * 7  === 42", function() {
        expect(6 * 7).toBe(42);
    });
});
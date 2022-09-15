var Hands = require("./Hands.js").Hands;

function calibrate() {
    const prop_startTime = "startTime";
    const prop_palmPosition = "palmPosition";
    const hands = new Hands();
    hands.addData("hands", "Calibration\\data\\simple-1.json");
    hands.addData("hands", "Calibration\\data\\simple-2.json");
    hands.addData("hands", "Calibration\\data\\simple-3.json");
    var palmPositions = hands.getProperty(prop_palmPosition);
    var startTimes = hands.getProperty(prop_startTime);
    startTimes.sort((a, b) => a - b);

    console.log(`Aim at: ${hands.getCenterPoint(palmPositions)}`);
    console.log(`--based on frames collected between ${startTimes[0]} and ${startTimes[startTimes.length-1]}`);
}

calibrate();
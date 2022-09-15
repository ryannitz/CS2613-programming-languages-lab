const { readFile } = require("./read_json_file.js");

function Hands() {
    this.data = [];
}

/**
 * 
 * @param {*} hand  
 * @param {*} filename 
 */
Hands.prototype.addData = function(hand, filename) {
    var propertyName = hand;
    var filecontents = readFile(filename);
    for (key in filecontents) {
        if (key === propertyName) {
            var target = filecontents[key];
            if (Array.isArray(target)) {
                for (key in target) {
                    this.data.push(target[key]);
                }
            } else {
                this.data.push(target);
            }
        }
    }
}

/**
 * This needs to use a map somehow??
 * @param {*} property 
 * @returns 
 */
Hands.prototype.getProperty = function(property) {
    var propVals = [];
    //console.log(JSON.stringify(this.data));
    // data.map(() => {
    //     return 
    // })
    for (var i = 0; i < this.data.length; i++) {
        propVals.push(this.data[i][property]);
    }
    return propVals;
}

//find a way to do this that is a little more clean, maybe a map?
Hands.prototype.getCenterPoint = function(data) {
    var x = 0,
        y = 0,
        z = 0;
    for (var i = 0; i < data.length; i++) {
        x += data[i][0];
        y += data[i][1];
        z += data[i][2];
    }

    return [x / data.length, y / data.length, z / data.length]
}

module.exports.Hands = Hands;

// const hands = new Hands();
// hands.addData("hands", "JavaScript\\Calibration\\data\\simple-1.json");
// hands.getProperty("palmPosition");
// hands.getProperty("startTime");
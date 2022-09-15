let fs = require('fs');

function read_json_file(filename) {
    let contents = fs.readFileSync(filename);
    return JSON.parse(contents);
}
module.exports.readFile = read_json_file;
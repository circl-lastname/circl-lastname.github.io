const fs = require("fs");
const file = Uint8Array.from(fs.readFileSync("../os.bin"));

function num2hex(nr) {
  var nrHex = (nr & 0xff).toString(16);
  return ((nrHex.length == 2) ? "" : "0") + nrHex;
}

let result = "dcb ";

file.forEach((byte) => {
  result += `$${num2hex(byte)}, `;
});

console.log(result.slice(0, -2));

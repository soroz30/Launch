/*

  input:
  - number
  output:
  - printed star:
    - three star stars in every line except the middle line
    - 0 to (n/2-1) spaces between stars
    - in the middle line n stars
  algorithm:
    - count from n = Math.floor(7/2) + 1 to 0
    - if < n 
*/

function star(n) {
  var middle = Math.floor(n/2);
  for (var i = 0; i < n; i++) {
    if (i < middle) {
      var outside = i;
      var inside = middle - i - 1;
      printLine(outside, inside);
    } else if (i == middle) {
      console.log("*".repeat(n));
    } else {
      var outside = n - i - 1;
      var inside = i - (middle + 1)
      printLine(outside, inside);
    }
  }
}

function printLine(outside, inside) {
  var line = "";
  line += " ".repeat(outside) + ("*" + " ".repeat(inside)).repeat(3);
  return console.log(line);
}

console.log(star(7));
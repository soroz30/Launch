/*
  "1, 3, 7, 2, 4, 1" ---> "1, 3, 7, 12, 14, 21"
  "1-3 1-3" --> "1, 2, 3, 11, 12, 13"
  "1-4.2.7.5.3-2-1" --> "1, 4, 12, 17, 25, 33, 42, 51"
  "123-22-1-33/22" --> "123, 222, 231, 233, 322"
  "231323123213" --> "231323123213"
  "" --> ""
  "--/" --> ""
  "0-2"

  holka --> ""

  input:
    - String of separated digits
  output:
    - Array of numbers
      - cleaned from signs
      - 
*/ 

function expand(string) {
  var numbersArray = string.match(/(\d+|-|\/|,)/g);
  var result = [parseInt(string[0], 10)]
  numbersArray.forEach(function(number, index) {
    if (index < 2 || number.match(/[^0-9]/)) return;
    var number2 = String(result.slice(-1));
    var sign = numbersArray[index-1];
    addNumbers(number, number2, sign, result);
  })
  return result;
}

function addNumbers(number, number2, sign, result) {
  number = calculate2ndNumber(number, number2);
  if (sign == ",") {
    result.push(parseInt(number))
  } else {
    for (var i = number + 1; i <= number2; i++) {
      result.push(parseInt(i));
    }
  }
}

function calculate2ndNumber(number, number2) {
  if (parseInt(number2, 10) < parseInt(number, 10)) return number;
  var diff = number2.length - number.length;
  if (diff > 0) {
    number = diff + number;
    if (parseInt(number, 10) < parseInt(number2, 10)) {
      diff = String(parseInt(diff, 10) + 1);
      number = diff + number.slice(diff.length);
    }
  } else {
    number = "1" + number;
  }
  return number;
}

expand("1, 3, 8, 2, 4, 6, 2, 1")
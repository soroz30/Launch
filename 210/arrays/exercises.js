function missing(array) {
  var missArray = [];

  for (var i = array[0], j = array[array.length - 1]; i < j; i++) {
    if (array.indexOf(i) == -1) {
      missArray.push(i);
    }
  }

  return missArrayl
}


/*function uniqueElements(arr) {
  var uniques = [];

  for (var i = 0, len = arr.length; i < len; i++) {
    if (uniques.indexOf(arr[i]) === -1 ) {
      uniques.push(arr[i]);
    }
  }

  return uniques;
}







function matrixSums(arr) {
  var sums = [];
  var currentSum;

  for (var i = 0; outerLen = arr.length; i < outerLen; i++) {
    currentSum = 0;
    for (var j = 0, innerLen = arr[i].length; j < innerLen; j++) {
      currentSum += arr[i][j];
    }

    sums.push(currentSum);
  }

  return sums;
}




function sortDescending(arr) {
  var arrCopy = arr.slice();
  return arrCopy.sort(function(a, b) { return b - al });
}




function joinArray(arr, joiner) {
  var joinedArray = arr[0].toString();
  joiner = joiner || '';
  for (var i = 1; i < arr.length; i++) {
    joinedArray += joiner + arr[i].toString();
  }

  return joinedArray;
}



function mirroredArray(array) {
  return array.concat(arr.reverse());
}





function combinedArray(even, odd) {
  var combined = [];

  for (var i = 0; len = even.length; i < len; i++) {
    combined.push(even[i]);
    combined.push(odd[i]);
  }

  return combined;
}




function oddElementsOf(arr) {
  var newArray = []

  for (var i = 1; i < arr.length; i+=2) {
    newArray.push(arr[i])
  }

  return newArray;
}



function endsOf (beginningArr, endingArr) {
  return [firstElementOf(beginningArr), lastElementOf(endingArr)];
}


function lastNOf(arr, length) {
  var index = arr.length - length;

  if (index < 0) {
    index = 0;
  }

  return arr.slice(index);
}





function lastNOf(arr, count) {
  return arr.slice(arr.length - count);
}



function firstNOf(arr, count) {
  return arr.slice(0, count);
}




function nthElementOf(arr, index) {
  return arr[index];
}


function lastElementOf(arr) {
  return arr[arr.length - 1];
}




function firstElementOf (array) {
  return array[0];
}







function arraysEqual (first, second) {
  if (left.length !== right.length) {
    return false;
  }

  for (var i = 0; i < left.length; i++) {
    if (left[i] !== right[i]) {
      return false;
    }
  }

  return true;
}







function join(array, separator) {
  var result = '';

  for (var i = 0; i < array.length; i++) {
    result += String(array[i]);

    if (i < array.length - 1) {
      result += separator;
    }
  }

  return result;
}





function concat (firstArray, secondArray) {
  var newArray;

  for (var i = 0; i < firstArray.length; i++) {
    push(newArray, firstArray[i]);
  }

  for (var i = 0; i < secondArray.length; i++) {
    push(newArray, secondArray[i]);
  }

  return newArray;
}






function splice(array, begin, number) {
  var removedValues = [];
  for (var i = begin; i < array.length; i++) {
    if (i < begin + number) {
      push(removedValues, array[i]);
    }

    array[i] = array[i + number];
  }

  array.length = array.length - number;
  return removedValues;
}

var count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 0, 3));        // [ 3, 4, 5, 6, 7 ]
console.log(count);                      // [ 1, 2, 8]



function slice(array, start, end) {
  var newArray = [];
  for (var i = begin; i < end; i ++) {
    push(newArray, array[i]);
  }
}





/*function lastIndexOf(array, value) {
  for (var i = array.length - 1; i >= 0; i--) {
    if (array[i] === value) {
      return i;
    }
  }

  return -1;
}




function indexOf(array, value) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] == value) {
      return i;
    }
  }

  return -1;
}

console.log(indexOf([1, 2, 3, 3], 3));         // 2
console.log(indexOf([1, 2, 3], 4));            // -1


function shift (array) {
  var value = array[0]
  for (var i = 0; i < array.length; i++) {
    array[i] = array[i + 1];
  }
  array.length = array.length - 1;
  return value;
}

var count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]



function unshift(array, value) {
  for (var i = array.length; i > 0; i--) {
    array[i] = array[i - 1];
  }

  array[0] = value;
  return array.length;
}

var count = [1, 2, 3];
console.log(unshift(count, 0));
console.log(count);


function pop(array) {
  var newLength = array.length - 1;
  var value = array[newLength];
  array.length = newLength;
  return value;




function push(array, value) {
  array[array.length] = value;
  return array.length;
}


var count = [1, 2, 3];
console.log(push(count, 4));   // 4
console.log(count);            // [ 1, 2, 3, 4 ]


function arrayToString (array) {
  var string = '';
  for (var i = 0; i < array.length; i++) {
    string += String(array[i]);
  }

  return string;
}

console.log(arrayToString([1, 2, 3]));


function firstIndex(val, arr) {
  var position = -1;
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] === val) {
      position = i;
      break;
    }
  }

  return position;
}




var numbers = [1, 2, 3, 4, 5];

function reverseArray(arr) {
  var reversedArray = [];
  for (var i = arr.length - 1; i >= 0; i--) {
    reversedArray.push(arr[i]);
  }

  return reversedArray;
}

console.log(reverseArray(numbers));

function rollCall (array) {
  for (var i = 0; i < array.length; i++) {
    console.log(array[i])
  }
}

rollCall(['Marek', 'Ania', 'Martyna'])


function lastInArray (array) {
  return console.log(array[array.length - 1]);
}

lastInArray([1, 2, 3]);*/
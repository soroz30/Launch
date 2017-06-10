function formatTime (date) {
  return addZero(date.getHours()) + ':' + addZero(date.getMinutes());
}

function addZero(val) {
  return String(val).length < 2 ? String(val) : String(val) + '0';
}


/*console.log("Today's date is " + daysOfWeek[today.getDay] + ', ' +
                                 months[today.getMonth()] + ' ' +
                                 dateSuffix(today.getDate()));


function dateSuffix (day) {
  var day_split = String(day).split('');
  var last_number = day_split[day_split.length - 1];
  var suffx = 'th'

  if (last_number == '1') {
    suffix = 'st';
  } else if (last_number == '2') {
    suffix = 'nd';
  } else if (last_number == '3') {
    suffix = 'rd';
  }

  return day_split.join() + suffix;
}

function formattedDay(date) {
  var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return daysOfWeek[date.getDay()];
}

function formattedMonth(date) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return months[date.getMonth()];
}


function formattedDate (date) {
  return "Today's date is " + formattedDay(date) + ', ' +
                              formattedMonth(date) + ' ' +
                              dateSuffix(date)
}

formattedDate(date);

console.log(dateSuffix(3));

console.log("Today's date is " + daysOfWeek[today.getDay()] + ', the ' + String(today.getDate()) + 'th');

console.log("Today's day is " + daysOfWeek[today.getDay()]);

console.log("Today's day is " + String(today.getDay()));




function radiansToDegrees(radians) {
  return radians / (Math.PI / 180);
}




function wordCount(text) {
  var count = {};
  var words = text.split();
  var word;

  for (var i = 0; i < words.length; i++) {
    word = words[i];
    if (!count[word]) {
      count[word] = 0;
    }

    count[word] += 1;
  }

  return count;
}








function copyProperties (objectOne, objectTwo) {
  var count = 0;
  for (var i in objectOne) {
    objectTwo[i] = objectOne[i];
    count++;
  }

  return count;
}

var hal = {
  model: 9000,
  enabled: true,
};
var sal = {};
copyProperties(hal, sal);
sal;



function incrementProperty(object, string) {
  if (object[string]) {
    object[string] += 1;
  } else {
    object[string] = 1;
  }

  return object[string];
}

var wins = {
  steve: 3,
  susie: 4,
};


function objectHasProperty(object, propertyName) {
  var keys = Object.keys(object);
  return keys.indexOf(propertyName) !== -1;
}
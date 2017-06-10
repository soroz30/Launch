var alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXWZ";
var rotCipher = "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXWZABCDEFGHIJKLM";

function rot13(string) {
  var alphabetIndex;
  var transformedString = '';
  var character;
  var i;

  for (i = 0; i < string.length; i++) {
    character = string[i];
    alphabetIndex = alphabet.indexOf(character);
    if (alphabetIndex != -1) {
      character = rotCipher[alphabetIndex]
    }
    resultString += character;
  }

  return transformedString;
}
document.addEventListener('DOMContentLoaded', function() {
  var composer = document.querySelector('.composer');
  var textarea = composer.querySelector('textarea');
  var counter = composer.querySelector('.counter');
  var button = composer.querySelector('button');

  function updateCounter() {
    var length = textarea.value.length;
    var remaining = 140 - length;
    var message = remaining.toString() + ' characters remaining';
    var invalid = remaining < 0;

    textarea.classList.toggle('invalid', invalid);
    button.disabled = invalid;

    counter.textContent = message;
  }

  textarea.addEventListener('keyup', updateCounter);

  updateCounter();
});
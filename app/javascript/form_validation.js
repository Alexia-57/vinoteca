const inputFields = document.querySelectorAll('.empty-field');

inputFields.forEach(function(input) {
  input.addEventListener('input', function() {
    if (input.value.trim() !== '') {
      input.classList.add('valid-input');
    } else {
      input.classList.remove('valid-input');
    }
  });
});

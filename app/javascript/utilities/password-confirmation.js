document.addEventListener('turbolinks:load', function() {
  var confirmationField = document.querySelector('.pass-confirm')

  if (confirmationField) { confirmationField.addEventListener('input', matchNotification) }
})

function matchNotification() {
  var password = document.querySelector('.password')
  var match = document.querySelector('.text-success')
  var notMatch = document.querySelector('.text-danger')

  if (password.value != "") {
    if (password.value == this.value) {
      notMatch.classList.add('hide')
      match.classList.remove('hide')
    } else if (this.value == "") {
      match.classList.add('hide')
      notMatch.classList.add('hide')
    } else {
      match.classList.add('hide')
      notMatch.classList.remove('hide')
    }
  } else {
    return
  }
}

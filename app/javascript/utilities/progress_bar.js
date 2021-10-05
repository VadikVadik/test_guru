document.addEventListener('turbolinks:load', function () {
  var progress = document.querySelector('.progress-bar')

  if (progress) {
    var newValue = progress.dataset.qNumberId - 1
    progress.value = newValue
  }
})

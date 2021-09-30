document.addEventListener('turbolinks:load', function () {
  var progress = document.querySelector('.progress-bar')

  if (progress) {
    var newValue = progress.dataset.qNumberId
    progress.value = newValue
  }
})

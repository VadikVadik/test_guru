document.addEventListener('turbolinks:load', function () {
  var timer = document.querySelector('.timer')

   if (timer) {
     setInterval(showCountdown, 1000)
   }
})

function showCountdown() {
  var timer = document.querySelector('.timer')

  var nowDate = new Date()

  var timeNow = nowDate.getTime() / 1000
  var timeOut = timer.dataset.timeOut

  var timeDiff = timeOut - timeNow

  var days = timeDiff / (60 * 60 * 24)
  timeDiff = timeDiff % (60 * 60 * 24)
  var hours = timeDiff / (60 * 60)
  timeDiff = timeDiff % (60 * 60)
  var minutes = timeDiff / 60
  var secundes = timeDiff % 60

  timer.innerHTML = Math.floor(minutes) + ":" + Math.floor(secundes)

}

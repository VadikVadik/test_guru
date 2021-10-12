document.addEventListener('turbolinks:load', function () {
  var timer = document.querySelector('.timer')

   if (timer) {
     timer.innerHTML = Math.floor(timeDiff(timer)/60) + ":" + Math.floor(timeDiff(timer)%60)
     setInterval(showCountdown, 1000)
   }
})

function showCountdown(timer, timeOut) {
  var timer = document.querySelector('.timer')
  var timeOut = document.querySelector('.time-out')

  if (timer) {
    var minutes = Math.floor(timeDiff(timer)/60)
    var secundes = Math.floor(timeDiff(timer)%60)

      if ((minutes + secundes) == 0) {
        timeOut.click()
      }

    timer.innerHTML = addZero(minutes) + ":" + addZero(secundes)
  }
}

function timeDiff(timer) {
  var nowDate = new Date()
  var timeNow = nowDate.getTime() / 1000
  var timeOut = timer.dataset.timeOut

  return timeOut - timeNow
}

function addZero(num) {
  var res = num
  if (num < 10) {
    res = "0" + num
  }
  return res
}

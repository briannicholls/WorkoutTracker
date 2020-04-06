document.addEventListener('turbolinks:load', () => {
  const btns = document.getElementsByClassName('leaderboard-buttons')
  for (let button of btns) {
    if(window.location.href == button.href){
      button.classList.add('w3-yellow')
    }
  }
})

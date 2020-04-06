document.addEventListener('turbolinks:load', () => {
  // const buttons = document.getElementsByClassName('plus-minus')
  // addListenersToButtons(buttons)
  const btns = document.getElementsByClassName('leaderboard-buttons')
  for (let button of btns) {
    console.log('iterating through buttons....')
    if(window.location.href == button.href){
      button.classList.add('w3-white')
    }
  }
})

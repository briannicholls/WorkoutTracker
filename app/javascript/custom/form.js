document.addEventListener('turbolinks:load', () => {
  const buttons = document.getElementsByClassName('plus-minus')
  addListenersToButtons(buttons)
})

function addListenersToButtons(collection) {
    for(let item of collection) {
      addIncrementListener(item)
    }
}

function addIncrementListener(element) {
  element.addEventListener('click', (e) => {
    const num = document.getElementById('numba')
    const numToIncrement = parseInt(e.target.innerText)
    num.value = parseInt(num.value) + numToIncrement
  })
}

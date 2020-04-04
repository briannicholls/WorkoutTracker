document.addEventListener('DOMContentLoaded', () => {
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
    //console.log(`current value: ${num.value}`)

    const numToIncrement = parseInt(e.target.innerText)
    // console.log(parseInt(e.target.innerText))
    // console.log(`num to increment: ${numToIncrement}`)
    num.value = parseInt(num.value) + numToIncrement
  })
}

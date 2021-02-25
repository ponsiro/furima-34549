function checkPrice() {
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value
    const addTaxDom = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")
    addTaxDom.innerHTML = Math.floor(inputValue/10)
    profit.innerHTML = Math.floor(inputValue - inputValue/10)
  });
}

window.addEventListener('load', checkPrice)

function itemPrice (){
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1)
    const profit = Number(inputValue) - Number(tax)
    addTaxDom.innerHTML = tax
    profitDom.innerHTML = profit
  })
 };
 
 window.addEventListener('turbo:load', itemPrice);
 window.addEventListener("turbo:render", itemPrice);
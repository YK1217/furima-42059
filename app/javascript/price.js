function price (){
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keyup", () => {
    const totalPrice = parseInt(itemPrice.value);

    let taxPriceInt;
    let profitPrice;

    if (Number.isNaN(totalPrice)) {
      taxPriceInt = 0;
      profitPrice = 0;
    } else {
    const taxPrice = totalPrice * 0.1;
    taxPriceInt = Math.trunc(taxPrice);
    profitPrice = totalPrice - taxPriceInt;
    }

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = taxPriceInt;
    const profit = document.getElementById("profit");
    profit.innerHTML = profitPrice;
  });
};

window.addEventListener('turbo:load', price);
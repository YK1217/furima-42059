const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) {return; }
  const TAX_RATE = 0.1;
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {

    const inputValue = priceInput.value;
    const totalPrice = parseInt(inputValue, 10);

    // 入力が空、または数値でない場合は0を表示して処理を終了
    if (inputValue === "" || Number.isNaN(totalPrice)) {
      addTaxPrice.innerHTML = 0;
      profit.innerHTML = 0;
      return;
    }

    const tax = Math.floor(totalPrice * TAX_RATE);
    const profitPrice = totalPrice - tax;

    addTaxPrice.innerHTML = tax;
    profit.innerHTML = profitPrice;
  });
};

window.addEventListener('turbo:load', price);
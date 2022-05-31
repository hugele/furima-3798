// function price() {
//   const priceInput = document.getElementById("item-price");
//   const add_tax = document.getElementById("add-tax-price");
//   const profit = document.getElementById("profit");
//    priceInput.addEventListener("keyup", () => {
//     const value = priceInput.value;

//     if (value >= 300 && value <= 9999999) {
//       let fee = value * 0.1;
//       let gains = value - fee;
//       add_tax.textContent = Math.floor(fee);
//       profit.textContent = Math.floor(gains);
//     } else {
//       let fee = " ";
//       let gains = " ";
//       add_tax.textContent = fee;
//       profit.textContent = gains;
//     }
//   });
// }
// window.addEventListener("load", price);

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});
window.addEventListener('load', () => {
  // 価格、販売手数料、販売利益のデータ取得
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const salesProfit = document.getElementById("profit");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  //  販売手数料の処理
  var price =  inputValue * 0.1
  addTaxDom.innerHTML = Math.floor(price);
  // 販売利益の処理
  var profit = inputValue * 0.9
  salesProfit.innerHTML = Math.floor(profit);
})
});
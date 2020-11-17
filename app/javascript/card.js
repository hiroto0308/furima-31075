const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY)
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    // 送信のキャンセル
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("donation_form[number]"),
      cvc: formData.get("donation_form[cvc]"),
      exp_month: formData.get("donation_form[exp_month]"),
      exp_year: `20${formData.get("donation_form[exp_year]")}`,
    };
    // カード情報のトークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      //  記入内容削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      // jsでの送信処理
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
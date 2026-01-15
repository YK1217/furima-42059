const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  if (!form) return;

  form.addEventListener(
    'submit',
    (e) => {
      e.preventDefault();

      payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
          // 失敗時は送信しない
          return;
        }

        // hidden_field(:token) に代入
        const token = response.id;
        const tokenInput = document.getElementById('token');
        tokenInput.value = token;

        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();

        form.submit();
      });
    },
    { once: true }
  );
};

window.addEventListener('turbo:load', pay);
window.addEventListener('turbo:render', pay);

const pay = () => {
  const form = document.getElementById('charge-form');
  if (!form) return;

  // Turbo再描画などで pay() が再度呼ばれても、同じフォームでは初期化しない
  if (form.dataset.payjpInitialized === 'true') return;
  form.dataset.payjpInitialized = 'true';

  const publicKey = gon?.public_key;
  if (!publicKey) {
    console.error('PAY.JP public key is missing (gon.public_key)');
    return;
  }

  const payjp = Payjp(publicKey);
  const elements = payjp.elements();

  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  // ERBに置いた #payjp-error を使う
  const errorBox = document.getElementById('payjp-error');
  const showError = (message) => {
    if (!errorBox) {
      console.error('payjp-error element not found:', message);
      return;
    }
    errorBox.textContent = message || '';
    // errorBox.style.display = message ? 'block' : 'none';
  };
  const clearError = () => showError('');

  // 二重送信防止
  let isSubmitting = false;

  form.addEventListener('submit', async (e) => {
    // tokenが既に入っているならそのまま送信（ブラウザ戻る等のケース）
    const tokenInput = document.getElementById('token');
    if (tokenInput?.value) return;

    e.preventDefault();

    if (isSubmitting) return;
    isSubmitting = true;

    // 送信ボタンを一時的に無効化
    const submitButton = form.querySelector(
      'input[type="submit"], button[type="submit"]'
    );
    if (submitButton) submitButton.disabled = true;

    clearError();

    try {
      const response = await payjp.createToken(numberElement);

      if (response.error) {
        // 配送先入力のエラーを削除
        clearRailsErrors();

        // PayJPのエラーメッセージを表示（無ければ汎用文）
        showError(response.error.message || 'カード情報を確認してください。');

        // 再入力・再送信できるように戻す
        isSubmitting = false;
        if (submitButton) submitButton.disabled = false;
        errorBox.scrollIntoView({ behavior: 'auto' });
        return;
      }

      tokenInput.value = response.id;

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      form.submit();
    } catch (err) {
      console.error(err);
      showError('決済処理でエラーが発生しました。再度お試しください。');

      isSubmitting = false;
      if (submitButton) submitButton.disabled = false;
      errorBox.scrollIntoView({ behavior: 'auto' });
    }
  });
};

const clearRailsErrors = () => {
  const railsErrorBox = document.querySelector('.error-alert, .error-message');
  if (railsErrorBox) {
    railsErrorBox.innerHTML = '';
  }
};

window.addEventListener('turbo:load', pay);
window.addEventListener('turbo:render', pay);

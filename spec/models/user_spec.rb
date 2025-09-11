require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password、password_confirmation、first_name、second_name、first_name_kana、second_name_kana、birthdayが存在すれば登録できる' do
        binding.pry
        #expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'password_confirmationが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが129文字以上では登録できない' do
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'first_nameが全角でなければ登録できない' do
      end
      it 'second_nameが空では登録できない' do
      end
      it 'second_nameが全角でなければ登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが全角カタカナでなければ登録できない' do
      end
      it 'second_name_kanaが空では登録できない' do
      end
      it 'second_name_kanaが全角カタカナでなければ登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end
end

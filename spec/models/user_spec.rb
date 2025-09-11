require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき'
      it 'nicknameとemail、password、password_confirmation、first_name、second_name、first_name_kana、second_name_kana、birthdayが存在すれば登録できる' do
        binding.pry
        #expect(@user).to be_valid
      end
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角文字で数字と英字を両方使用してください'}

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'} do
      validates :first_name
      validates :second_name
    end
    with_options format: {with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください'} do
      validates :first_name_kana
      validates :second_name_kana
    end
  end
end

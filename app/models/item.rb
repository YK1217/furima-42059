class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charged_by
  belongs_to :area
  belongs_to :length

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :caption
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "半角数字（300以上9,999,999以下）で入力してください"}
    validates :image
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :charged_by_id
    validates :area_id
    validates :length_id
  end
end

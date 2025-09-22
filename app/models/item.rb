class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :caption
    validates :price
    validates :image
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
  end
end

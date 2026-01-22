class BuyingShipping
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :address, :building, :phone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token, presence: { message: "can't be blank. Enter your card information"}

    validates :postcode, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid. Only numbers are allowed"}
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank"}

  validate :seller_cannot_buy_own_item

  def save
    buying = Buying.create!(user_id: user_id, item_id: item_id)

    Shipping.create!(buying_id: buying.id, postcode: postcode, area_id: area_id, city: city, address: address, building: building, phone: phone)
  end

  private
  def seller_cannot_buy_own_item
    return if item_id.blank? || user_id.blank?

    item = Item.find_by(id: item_id)
    return if item.nil?
    if item.user_id == user_id
      errors.add(:base, "出品者は自分の商品を購入できません")
    end
  end
end

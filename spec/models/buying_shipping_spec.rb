require 'rails_helper'

RSpec.describe BuyingShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    @buying_shipping = FactoryBot.build(:buying_shipping, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'token、postcode、city、address、phoneが存在し、areaが未選択で無ければ購入できる' do
        expect(@buying_shipping).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @buying_shipping.building = ''
        expect(@buying_shipping).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'postcodeが空では購入できない' do
        @buying_shipping.postcode = ''
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Postcode can't be blank"
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @buying_shipping.postcode = '1234567'
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
      end
      it 'cityが空では購入できない' do
        @buying_shipping.city = ''
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "City can't be blank"
      end
      it 'phoneが空では購入できない' do
        @buying_shipping.phone = ''
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが半角でなければ購入できない' do
        @buying_shipping.phone = '０１２３４５６７８９'
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Phone is invalid. Only ten or eleven half-width numbers are allowed"

      end
      it 'phoneが数字でなければ購入できない' do
        @buying_shipping.phone = 'abcde'
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Phone is invalid. Only ten or eleven half-width numbers are allowed"
      end
      it 'phoneが9桁以下では購入できない' do
        @buying_shipping.phone = '12345678'
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Phone is invalid. Only ten or eleven half-width numbers are allowed"
      end
      it 'phoneが12桁以上では購入できない' do
        @buying_shipping.phone = '123456789012'
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Phone is invalid. Only ten or eleven half-width numbers are allowed"
      end
      it 'addressが空では購入できない' do
        @buying_shipping.address = ''
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Address can't be blank"
      end
      it 'areaが未選択だと購入できない' do
        @buying_shipping.area_id = 1
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Area can't be blank"
      end
      it 'userが紐づいてなければ購入できない' do
        @buying_shipping.user_id = nil
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいてなければ購入できない' do
        @buying_shipping.item_id = nil
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "Item can't be blank"
      end
      it '出品者と購入者が同じ場合は購入できない' do
        item = Item.find_by(id: @buying_shipping.item_id)
        item.user_id = @buying_shipping.user_id
        item.save
        @buying_shipping.valid?
        expect(@buying_shipping.errors.full_messages).to include "出品者は自分の商品を購入できません"
      end
    end
  end
end

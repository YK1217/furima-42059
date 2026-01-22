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

      end
      it 'buildingが空でも購入できる' do

      end
    end

    context '商品を購入できない場合' do
      it 'postcodeが空では購入できない' do

      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと購入できない' do

      end
      it 'cityが空では購入できない' do

      end
      it 'phoneが空では購入できない' do

      end
      it 'phoneが半角でなければ購入できない' do

      end
      it 'phoneが数字でなければ購入できない' do

      end
      it 'phoneが9桁以下では購入できない' do

      end
      it 'phoneが12桁以上では購入できない' do

      end
      it 'addressが空では購入できない' do

      end
      it 'areaが未選択だと購入できない' do

      end
      it 'userが紐づいてなければ購入できない' do

      end
      it 'itemが紐づいてなければ購入できない' do

      end
      it '出品者と購入者が同じ場合は購入できない' do

      end
    end
  end
end

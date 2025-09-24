require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'name、caption、price、imageが存在し、category、status、charged_by、area、lengthが未選択で無ければ商品出品できる' do
      end
    end
    context '商品出品できない場合' do
      it 'nameが空では商品出品できない' do
      end
      it 'captionが空では商品出品できない' do
      end
      it 'categoryが未選択だと商品出品できない' do
      end
      it 'statusが未選択だと商品出品できない' do
      end
      it 'charged_byが未選択だと商品出品できない' do
      end
      it 'areaが未選択だと商品出品できない' do
      end
      it 'lengthが未選択だと商品出品できない' do
      end
      it 'priceが空では商品出品できない' do
      end
      it 'priceが半角数字でなければ商品出品できない' do
      end
      it 'priceが300円未満では商品出品できない' do
      end
      it 'priceが9999999円を超えると商品出品できない' do
      end
      it 'imageが空では商品出品できない' do
      end
      it 'userが紐づいてなければ商品出品できない' do
      end

    end
  end
end

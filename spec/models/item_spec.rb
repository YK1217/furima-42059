require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'name、caption、price、imageが存在し、category、status、charged_by、area、lengthが未選択で無ければ商品出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'nameが空では商品出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'captionが空では商品出品できない' do
        @item.caption = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Caption can't be blank"
      end
      it 'categoryが未選択だと商品出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'statusが未選択だと商品出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'charged_byが未選択だと商品出品できない' do
        @item.charged_by_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charged by can't be blank"
      end
      it 'areaが未選択だと商品出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'lengthが未選択だと商品出品できない' do
        @item.length_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Length can't be blank"
      end
      it 'priceが空では商品出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角でなければ商品出品できない' do
        @item.price = '１２３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 半角数字（300以上9,999,999以下）で入力してください"
      end
      it 'priceが数字でなければ商品出品できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 半角数字（300以上9,999,999以下）で入力してください"
      end
      it 'priceが300円未満では商品出品できない' do
        @item.price = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 半角数字（300以上9,999,999以下）で入力してください"
      end
      it 'priceが9999999円を超えると商品出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 半角数字（300以上9,999,999以下）で入力してください"
      end
      it 'imageが空では商品出品できない' do
        @item.image.purge
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'userが紐づいてなければ商品出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end

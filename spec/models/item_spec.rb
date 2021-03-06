require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    it 'image,name,about, category_id, status_id, delivery_fee_burden_id, shipment_source_id, delivery_day_id, price, user_idがあれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空なら登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it 'nameが空なら登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it 'aboutが空なら登録できない' do
      @item.about = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "About can't be blank"
    end

    it 'category_idが空なら登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it 'status_idが空なら登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end

    it 'delivery_fee_burden_idが空なら登録できない' do
      @item.delivery_fee_burden_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery fee burden can't be blank"
    end

    it 'shipment_source_idが空なら登録できない' do
      @item.shipment_source_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipment source can't be blank"
    end

    it 'delivery_day_idが空なら登録できない' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery day can't be blank"
    end

    it 'priceが空なら登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it 'userが空なら登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include 'User must exist'
    end

    it 'priceが全角数字なら登録できない' do
      @item.price = '２２２２２２'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end

    it 'priceが300より小さいなら登録できない' do
      @item.price = 222
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
    end

    it 'priceが9999999より大きいなら登録できない' do
      @item.price = 1_000_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
    end

    it 'nameが40文字より多いと登録できない' do
      @item.name = 's' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
    end

    it 'aboutが1000文字より多いと登録できない' do
      @item.about = 's' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include 'About is too long (maximum is 1000 characters)'
    end

    it 'category_idが1だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category must be other than 1'
    end

    it 'status_idが1だと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Status must be other than 1'
    end

    it 'delivery_fee_burden_idが1だと出品できない' do
      @item.delivery_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delivery fee burden must be other than 1'
    end

    it 'shipment_source_idが1だと出品できない' do
      @item.shipment_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Shipment source must be other than 1'
    end

    it 'delivery_day_idが1だと出品できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delivery day must be other than 1'
    end

    it 'priceが半角英数字混合では出品できない' do
      @item.price = '333aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end

    it 'priceが半角英字のみでは出品できない' do
      @item.price = 'aiueo'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
  end
end

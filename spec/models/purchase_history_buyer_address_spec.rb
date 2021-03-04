require 'rails_helper'

RSpec.describe PurchaseHistoryBuyerAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_history_buyer_address = FactoryBot.build(:purchase_history_buyer_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

  describe '商品購入機能' do
    it "全て正しく入力されていれば購入できる" do
      expect(@purchase_history_buyer_address).to be_valid
    end
    it 'postal_codeが空なら購入できないこと' do
      @purchase_history_buyer_address.postal_code = ''
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Postal code can't be blank"
    end
    it 'postal_codeのハイフンがないと購入できないこと' do
      @purchase_history_buyer_address.postal_code = '1234567'
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Postal code is invalid"
    end
    it 'shipment_source_idが選択されていないと購入できないこと' do
      @purchase_history_buyer_address.shipment_source_id = ''
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Shipment source can't be blank"
    end
    it 'shipment_source_idが1だと購入できないこと' do
      @purchase_history_buyer_address.shipment_source_id = 1
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Shipment source must be other than 1"
    end
    it 'cityが空なら購入できないこと' do
      @purchase_history_buyer_address.city = ''
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "City can't be blank"
    end
    it 'address_line_brockが空だと購入できないこと' do
      @purchase_history_buyer_address.address_line_block = ''
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Address line block can't be blank"
    end
    it 'address_line_buildingはからでも購入できる' do
      @purchase_history_buyer_address.address_line_building = ''
      expect(@purchase_history_buyer_address).to be_valid
    end
    it 'phone_numberが空なら登録できないこと' do
      @purchase_history_buyer_address.phone_number = ''
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Phone number can't be blank"
    end
    it 'phone_numberが0以外の数値から始まる11桁の数値では購入できないこと' do
      @purchase_history_buyer_address.phone_number = '11111111111'
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Phone number is invalid"
    end
    it 'phone_numberが10桁の数値なら購入できないこと' do
      @purchase_history_buyer_address.phone_number = '0123456789'
      @purchase_history_buyer_address.valid?
      expect(@purchase_history_buyer_address.errors.full_messages).to include "Phone number is invalid"
    end
  end
end

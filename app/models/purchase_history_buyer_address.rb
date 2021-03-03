class PurchaseHistoryBuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipment_source_id, :city, :address_line_block, :address_line_building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipment_source_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line_block
    validates :phone_number, format: {with: /\A0[0-9]{10}\z/}
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    BuyerAddress.create(postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, address_line_block: address_line_block, address_line_building: address_line_building, phone_number: phone_number, purchase_history_id:  purchase_history.id)
  end
end
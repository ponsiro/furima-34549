FactoryBot.define do
  factory :purchase_history_buyer_address do
    postal_code {'123-4567'}
    shipment_source_id {2}
    city {'船橋市'}
    address_line_block {'舟2-2'}
    address_line_building {'東海ハイツ 304'}
    phone_number { '09012345678' }
  end
end

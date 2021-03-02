class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string          :postal_code,            null: false
      t.integer         :prefecture_id,          null: false
      t.string          :city,                   null: false
      t.string          :address_line_block,     null: false
      t.string          :address_line_building
      t.string          :phone_number,           null: false
      t.references      :purchase_history,       null: false, foreign_key: true

      t.timestamps
    end
  end
end

class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :about
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :ststus_id
      validates :delivery_fee_burden_id
      validates :shipment_source_id
      validates :delivery_day_id
    end
    validates :price
    validates :user, foreign_key: true
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :stutas
end

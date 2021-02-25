class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :about
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_burden_id, numericality: { other_than: 1 }
    validates :shipment_source_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price, numericality: {greater_than: 300,less_than: 9999999}
  end

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee_burden
  belongs_to :shipment_source
  belongs_to :delivery_day 
end

class Item < ApplicationRecord

  with_options presence: true do
    validates :name, length: { maxmum: 40 }
    validates :about, length: { maxmum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_burden_id, numericality: { other_than: 1 }
    validates :shipment_source_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price, numericality: {greater_than: 300,less_than: 9999999}, format: { with: /\A[0-9]+\z/ }
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

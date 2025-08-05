class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :total_price, presence: true, numericality: true
  validates :status, presence: true
  validates :shipping_address, presence: true
end

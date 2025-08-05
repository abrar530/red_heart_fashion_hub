class CustomerOrder < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # Basic presence validations
  validates :customer_name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validates :province, presence: true

  # Optional: Add these if your model has them
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }
end

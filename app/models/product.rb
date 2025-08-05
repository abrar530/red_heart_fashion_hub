class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  # Validations (ADD THESE HERE)
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    %w[id name description price category_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]  # Do NOT include "image_attachment" or "image_blob"
  end
end

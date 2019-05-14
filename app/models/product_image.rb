class ProductImage < ApplicationRecord
  belongs_to :product

  dragonfly_accessor :image
  validates_property :mime_type, of: :image, in: %w(image/jpeg image/png image/gif)
  validates :image, :product_id, presence: true

end

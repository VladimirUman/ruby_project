class Category < ApplicationRecord
  has_many :products, dependent: :restrict_with_exception

  has_many   :subcategories,   class_name: 'Category', foreign_key: :parent_id, dependent: :restrict_with_exception
  belongs_to :parent_category, class_name: 'Category', foreign_key: :parent_id, optional: true 
  scope :parent_categories, -> { where(parent_id: 0) }

  validates :name, presence: true
  validates_property :mime_type, of: :image, in: %w(image/jpeg image/png image/gif)

  dragonfly_accessor :image
end

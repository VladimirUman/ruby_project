class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  has_many   :subcategories,   class_name: 'Category', foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent_category, class_name: 'Category', foreign_key: :parent_id

  scope :parent_categories, -> { where(parent_id: nil) }

  dragonfly_accessor :image
end

class Product < ApplicationRecord

  has_many :line_items
  has_many :product_images, dependent: :destroy
  belongs_to :category

  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :title, :description, length: {minimum: 10}

  def self.search(search)
    if search
      where('title LIKE ?', '%'+search+'%')
    else
      all
    end
  end

  class Error < StandardError
  end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        raise Error.new "Line Items present"
      end
    end
end

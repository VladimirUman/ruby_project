class NewsAction < ApplicationRecord

  validates :title, :description, :image_url, :date, presence: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, :description, length: {minimum: 10}

end

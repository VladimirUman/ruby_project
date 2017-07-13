class NewsAction < ApplicationRecord

  validates :title, :description, :image, :date, presence: true

  validates_property :mime_type, of: :image, in: %w(image/jpeg image/png image/gif)

  validates :title, :description, length: {minimum: 10}
  validates :title, uniqueness: true

  dragonfly_accessor :image    # defines a reader/writer for image

end

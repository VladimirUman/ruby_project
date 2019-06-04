require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase

  def new_image(image_file)
    ProductImage.new(product_id: 1, image: image_file)
  end

  test "image url" do
    ok = %w{ lorem.gif lorem.jpg lorem.png }
    bad = %w{ lorem.doc lorem.txt lorem.avi }

    ok.each do |name|
      file = Rails.root + "/images/#{name}"
      assert new_image(file).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      file = Rails.root + "/images/#{name}"
      assert new_image(file).invalid?, "#{name} shouldn't be valid"
    end
  end
end

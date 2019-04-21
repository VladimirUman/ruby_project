#---
# Excerpted from "Agile Web Development with Rails 5",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails5 for more book information.
#---
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(title:       "My Book Title",
                          description: "My Description",
                          category_id: 2,
                          image:   Rails.root + "/images/lorem.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_file)
    Product.new(title:       "My Book Title",
                description: "My Description",
                price:       1,
                category_id: 2,
                image:   image_file)
  end

  test "image url" do
    ok = %w{ lorem.gif lorem.jpg lorem.png }
    bad = %w{ lorem.doc lorem.txt lorem.avi }

    ok.each do |name|
      file = Rails.root + "/images/#{name}"
      assert new_product(file).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      file = Rails.root + "/images/#{name}"
      assert new_product(file).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product title must be at least 10 characters long" do
    product = Product.new(title:       "Too short",
                          description: "My Description",
                          price:       1,
                          image:   "fred.gif")

    assert product.invalid?
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:       products(:ruby).title,
                          description: "yyy",
                          price:       1,
                          image:   "fred.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end

end

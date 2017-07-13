require 'test_helper'

class NewsActionTest < ActiveSupport::TestCase
  fixtures :news_actions
  test "product attributes must not be empty" do
    news = NewsAction.new
    assert news.invalid?
    assert news.errors[:title].any?
    assert news.errors[:description].any?
    assert news.errors[:date].any?
    assert news.errors[:image].any?
  end

  def add_news(image_file)
    NewsAction.new(title:       "My News Title",
                description: "My News Description",
                date:       "My date",
                image:   image_file)
  end

  test "image file" do
    ok = %w{ lorem.gif lorem.jpg lorem.png }
    bad = %w{ lorem.doc lorem.txt lorem.avi }

    ok.each do |name|
      file = Rails.root + "/images/#{name}"
      assert add_news(file).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      file = Rails.root + "/images/#{name}"
      assert add_news(file).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "news title must be at least 10 characters long" do
    news = NewsAction.new(title:       "Too short",
                          description: "yyy",
                          date:       "xxx",
                          image:   "fred.gif")

    assert news.invalid?
  end

  test "news is not valid without a unique title - i18n" do
    news = NewsAction.new(title:       news_actions(:ruby).title,
                          description: "yyy",
                          date:       "xxx",
                          image:   "fred.gif")

    assert news.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 news.errors[:title]
  end



end

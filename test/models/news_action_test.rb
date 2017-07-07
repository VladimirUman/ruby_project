require 'test_helper'

class NewsActionTest < ActiveSupport::TestCase
  fixtures :news_actions
  test "product attributes must not be empty" do
    news = NewsAction.new
    assert news.invalid?
    assert news.errors[:title].any?
    assert news.errors[:description].any?
    assert news.errors[:date].any?
    assert news.errors[:image_url].any?
  end

  def add_news(image_url)
    NewsAction.new(title:       "My Book Title",
                description: "yyyyyyyyyyyy",
                date:       "xxx",
                image_url:   image_url)
  end

  test "image url" do
    ok = %w{ petya.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert add_news(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert add_news(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "news title must be at least 10 characters long" do
    news = NewsAction.new(title:       "Too short",
                          description: "yyy",
                          date:       "xxx",
                          image_url:   "fred.gif")

    assert news.invalid?
  end

  test "news is not valid without a unique title - i18n" do
    news = NewsAction.new(title:       news_actions(:ruby).title,
                          description: "yyy",
                          date:       "xxx",
                          image_url:   "fred.gif")

    assert news.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 news.errors[:title]
  end



end

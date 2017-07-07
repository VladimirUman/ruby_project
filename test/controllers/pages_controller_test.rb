require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_url
    assert_response :success
  end

  test "should get contacts" do
    get contacts_url
    assert_response :success
  end

  test "should get news" do
    get news_url
    assert_response :success
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
  end

end

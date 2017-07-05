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
  
end

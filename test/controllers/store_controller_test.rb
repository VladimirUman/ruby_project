require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select '#products .product', 3
    assert_select 'h3', 'Ruby Performance Optimization'
    assert_select '.product-price'
  end

end

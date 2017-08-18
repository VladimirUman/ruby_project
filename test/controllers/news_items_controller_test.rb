require 'test_helper'

class NewsItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_item = news_items(:one)
    @update = {
      title:       'Lorem Ipsum',
      description: 'Wibbles are fun!',
      image:        fixture_file_upload('/images/lorem.jpg'),
      date:        '07.07.2017'
    }
  end

  test "should get index" do
    get news_items_url
    assert_response :success
  end

  test "should get new" do
    get new_news_item_url
    assert_response :success
  end

  test "should create news_action" do
    assert_difference('NewsItem.count') do
      post news_items_url, params: { news_item: @update }
    end

    assert_redirected_to news_item_url(NewsItem.last)
  end

  test "should show news_item" do
    get news_item_url(@news_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_item_url(@news_item)
    assert_response :success
  end

  test "should update news_action" do
    patch news_item_url(@news_item), params: { news_item: @update }
    assert_redirected_to news_item_url(@news_item)
  end

  test "should destroy news_item" do
    assert_difference('NewsItem.count', -1) do
      delete news_item_url(@news_item)
    end

    assert_redirected_to news_items_url
  end
end

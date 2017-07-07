require 'test_helper'

class NewsActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_action = news_actions(:one)
    @update = {
      title:       'Lorem Ipsum',
      description: 'Wibbles are fun!',
      image_url:   'lorem.jpg',
      date:        '07.07.2017'
    }
  end

  test "should get index" do
    get add_news_url
    assert_response :success
  end

  test "should get new" do
    get new_news_action_url
    assert_response :success
  end

  test "should create news_action" do
    assert_difference('NewsAction.count') do
      post news_actions_url, params: { news_action: @update }
    end

    assert_redirected_to news_action_url(NewsAction.last)
  end

  test "should show news_action" do
    get news_action_url(@news_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_action_url(@news_action)
    assert_response :success
  end

  test "should update news_action" do
    patch news_action_url(@news_action), params: { news_action: @update }
    assert_redirected_to news_action_url(@news_action)
  end

  test "should destroy news_action" do
    assert_difference('NewsAction.count', -1) do
      delete news_action_url(@news_action)
    end

    assert_redirected_to news_actions_url
  end
end

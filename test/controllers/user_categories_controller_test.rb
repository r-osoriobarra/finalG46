require 'test_helper'

class UserCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_categories_new_url
    assert_response :success
  end

  test "should get show" do
    get user_categories_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_categories_update_url
    assert_response :success
  end

  test "should get create" do
    get user_categories_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_categories_destroy_url
    assert_response :success
  end

end

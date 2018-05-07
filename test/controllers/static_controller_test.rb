require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get static_new_url
    assert_response :success
  end

  test "should get show" do
    get static_show_url
    assert_response :success
  end

  test "should get edit" do
    get static_edit_url
    assert_response :success
  end

  test "should get create" do
    get static_create_url
    assert_response :success
  end

  test "should get destroy" do
    get static_destroy_url
    assert_response :success
  end

end

require 'test_helper'

class JokesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jokes_index_url
    assert_response :success
  end

  test "should get show" do
    get jokes_show_url
    assert_response :success
  end

  test "should get create" do
    get jokes_create_url
    assert_response :success
  end

  test "should get edit" do
    get jokes_edit_url
    assert_response :success
  end

  test "should get update" do
    get jokes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get jokes_destroy_url
    assert_response :success
  end

end

require 'test_helper'

class EndUsers::PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get end_users_posts_index_url
    assert_response :success
  end

  test 'should get show' do
    get end_users_posts_show_url
    assert_response :success
  end

  test 'should get new' do
    get end_users_posts_new_url
    assert_response :success
  end

  test 'should get edit' do
    get end_users_posts_edit_url
    assert_response :success
  end
end

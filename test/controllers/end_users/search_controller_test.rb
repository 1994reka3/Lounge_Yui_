require 'test_helper'

class EndUsers::SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get end_users_search_index_url
    assert_response :success
  end
end

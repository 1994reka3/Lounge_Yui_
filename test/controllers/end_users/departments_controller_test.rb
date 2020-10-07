require 'test_helper'

class EndUsers::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_users_departments_show_url
    assert_response :success
  end

end

require 'test_helper'

class EndUsers::HealthCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_health_courses_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_health_courses_show_url
    assert_response :success
  end

end

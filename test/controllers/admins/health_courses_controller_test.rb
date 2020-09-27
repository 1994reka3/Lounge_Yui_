require 'test_helper'

class Admins::HealthCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_health_courses_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_health_courses_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_health_courses_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_health_courses_edit_url
    assert_response :success
  end

end

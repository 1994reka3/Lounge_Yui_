require 'test_helper'

class Admins::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admins_departments_index_url
    assert_response :success
  end

  test 'should get edit' do
    get admins_departments_edit_url
    assert_response :success
  end
end

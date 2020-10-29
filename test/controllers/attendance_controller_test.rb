require 'test_helper'

class AttendanceControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get attendance_create_url
    assert_response :success
  end

  test 'should get new' do
    get attendance_new_url
    assert_response :success
  end

  test 'should get destroy' do
    get attendance_destroy_url
    assert_response :success
  end
end

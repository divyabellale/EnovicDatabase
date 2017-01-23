require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address1: @student.address1, course: @student.course, date_of_admission: @student.date_of_admission, district: @student.district, dob: @student.dob, email: @student.email, father_name: @student.father_name, father_occupation: @student.father_occupation, fee_status: @student.fee_status, hobli: @student.hobli, name: @student.name, panchayat: @student.panchayat, phone: @student.phone, post: @student.post, student_type: @student.student_type, taluq: @student.taluq, village: @student.village }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { address1: @student.address1, course: @student.course, date_of_admission: @student.date_of_admission, district: @student.district, dob: @student.dob, email: @student.email, father_name: @student.father_name, father_occupation: @student.father_occupation, fee_status: @student.fee_status, hobli: @student.hobli, name: @student.name, panchayat: @student.panchayat, phone: @student.phone, post: @student.post, student_type: @student.student_type, taluq: @student.taluq, village: @student.village }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end

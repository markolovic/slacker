require 'test_helper'

class AssessmentsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

#  test "create should accept category and weight" do
#    get :create
#    assert ass.category
#    assert ass.weight
#  end

  test "course_id should be a params key and equal 1" do
    get :new, course_id: 1
    assert @request.params[:course_id] == '1'
  end

  test "assert @parent_course" do
    get :new, course_id: 1
    assert @parent_course == 1, "parent_course is not 1"
  end

end

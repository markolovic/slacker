require 'test_helper'

class AssessmentsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:ass)
    assert_template :new
    assert_template layout: "layouts/application"
  end

#  test "create should accept category and weight" do
#    get :create
#    assert ass.category
#    assert ass.weight
#  end

  #test "assert @parent_course" do
    #get :new, course_id: 1
    #assert @parent_course == 1, "parent_course is not 1"
  #end

end

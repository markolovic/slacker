require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get new" do
    get(:new, { :course_id => 2 })
    assert_response :success
    assert_not_nil assigns(:cat)
    assert_template :new
    assert_template layout: "layouts/application"
  end

  #test "should create category" do
    #@request.params[:
    #assert_difference('Category.count') do
      #post :create, category: {name: "testcat", weight: 0.1, reps: 1, course_id: 2}
    #end
  #end
end

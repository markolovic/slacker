require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @cat = categories(:Assignment)
  end

  # VALIDATIONS
  
  test "should not accept negative value for weight" do
    @cat.weight = -0.1
    assert_not @cat.save, "Saved category with negative weight value"
  end

  test "should not save cateogory without name" do
    @cat.name = nil
    assert_not @cat.save, "Saved category without name"
  end

  test "should not save without associated course" do
    @cat.course_id = nil
    assert_not @cat.save, "Saved category without associated course"
  end

  test "should not save if name is not unique to its course" do 
    cat2 = categories(:Midterm) 
    cat2.name = @cat.name 
    assert_not cat2.save, "Saved category with repeated name"
  end

  test "should not save if reps value is less than 1" do
    @cat.reps = 0
    assert_not @cat.save, "Saved category with reps 0"
    @cat.reps = -1
    assert_not @cat.save, "Saved category with reps -1"
  end

  #test "should not save category without attendance value" do
    #@cat.attendance is null
    #assert_not @cat.save "Saved category without attendance value"
  #end

  # METHODS
  
  test "weight percent method" do
    percent = @cat.weight_percent
    assert_match /\d\d\.\d+[%]/, percent
    percent = categories(:Midterm).weight_percent
    assert_match /\d\d\.\d+[%]/, percent
  end

  test "unit_weight method" do
    percent = categories(:Midterm).unit_weight
    assert_equal percent, 2
  end

  test "name_pluralized method" do
    name = @cat.name_pluralized
    assert_not_equal name, @cat.name
    cat2 = categories(:Midterm)
    name = cat2.name_pluralized
    assert_not_equal name, @cat.name
  end

  



  
    
end





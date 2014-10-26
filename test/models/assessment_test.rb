require 'test_helper'

class AssessmentTest < ActiveSupport::TestCase
  def setup 
    @ass1 = assessments(:assignment1)
    @ass2 = assessments(:assignment2)
    @midterm = assessments(:midterm)
  end

  test "should not save without category_id" do
    @ass1.category_id = nil
    assert_not @ass1.save
  end

  test "should not save without rep" do 
    @ass1.rep = nil
    assert_not @ass1.save
    @ass1.rep = 0
    assert_not @ass1.save
  end

  test "should save passing valid assessment" do 
    assessments.each do |a|
      assert a.save
    end
  end
    
end

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "should not save course with nil name" do
    course = Course.new(credits: 3)
    assert_not course.save, "Course was successfully saved without name attr"
  end

  test "should not save course with nil credits" do
    course = Course.new(name: "Physics")
    assert_not course.save, "Course was successfully saved without credits attr"
  end

end

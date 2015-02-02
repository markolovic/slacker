require 'rails_helper'

describe Course do
  let(:course) { build(:course) }
  context "should not be valid if" do
    it "without name" do
      course.name = nil
      expect(course).not_to be_valid
    end
    it "without credits" do
      course.credits = nil
      expect(course).not_to be_valid
    end
  end
end

describe Course, "#current_grade" do
  it "returns the current grade" do
    pending
    #course = create(:course_with_assessments, reps: 5, score: 0.7)
    course_with_assessments
    expect(course.current_grade).to eq 0.5
  end
end

def course_with_assessments 
  course = create(:course)
  categories = create_pair(:category, reps: 5, course: course)
  categories.each do |cat|
    create_list(:assessment, 5, category: cat, score: 0.5) 
  end
end

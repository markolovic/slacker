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
    course = create(:course_with_assessments)
    visit course_path(course.id)
    expect(page).to have_css
  end
end

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
    #it "sum of category weights is not 1" do
      #course.categories.new(:category)
    #end
  end
end

#TODO write course validation specs

describe Course, "#current_grade" do
  it "returns the current grade when all categories have grade" do
    course = build(:course)
    course.categories << category_with_assessments(0.5, 0.4)
    course.categories << category_with_assessments(0.7, 0.6)
    course.save # Necessary?
    expect(course.categories.first.grade).to eq 0.5
    expect(course.categories.last.grade).to eq 0.7
    expect(course.categories.all.size).to eq 2
    expect(course.current_grade).to eq 0.62
  end
  it "returns right grade when not all categories have grade" do
    course = build(:course)
    course.categories << category_with_assessments(0.5, 0.4)
    course.categories << category_with_assessments(nil, 0.6)
    course.save # Necessary?
    expect(course.current_grade).to eq 0.5
  end
  it "returns nil when no category is graded" do
    course = build(:course)
    course.categories << category_with_assessments(nil, 0.4)
    course.categories << category_with_assessments(nil, 0.6)
    course.save # Necessary?
    expect(course.current_grade).to eq nil
  end
  it "returns nil when course has no categories" do
    course = create(:course)
    expect(course.current_grade).to eq nil
  end
  #TODO DRY using before method?
end


#def course_with_assessments 
  #course = create(:course)
  #categories = create_pair(:category_with_assessments, reps: 5, course: course)
  #categories.each do |cat|
    #create_list(:assessment, 5, category: cat, score: 0.5) 
  #end
#end

require 'rails_helper'

def category_with_assessments(grade, weight)
  cat = create(:category_with_unique_name, weight: weight)
  cat.assessments.create(rep: 1, score: grade)
  cat
  #TODO turn into factory?
end

def course_with_assessments
    course = create(:course)
    course.categories << category_with_assessments(0.5, 0.4)
    course.categories << category_with_assessments(0.7, 0.6)
    # Course grade here is hardcoded above to 0.62
    course.save 
    course # Necessary?
    # Probably bad idea
end

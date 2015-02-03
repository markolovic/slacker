require 'rails_helper'

def category_with_assessments(grade, weight)
  cat = create(:category_with_unique_name, weight: weight)
  cat.assessments.create(rep: 1, score: grade)
  cat
  #TODO turn into factory?
end

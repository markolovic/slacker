require 'rails_helper'

feature "course show page displays warning message if category
         weights do not sum one" do
  scenario "weights do not sum one" do
    course = create(:course)
    course.categories << create(:category, weight: 0.1)
    visit course_path(course.id)
    expect(course.categories.all.size).to eq 1 
    expect(course.categories.take.weight).not_to eq 1
    expect(page).to have_css "p", text: "Weights"
    expect(page).to have_css "p", text: "Weights of all assessments do not sum 100%"
  end
  scenario "weights do sum one" do
    course = course_with_assessments # weights hardcoded to sum 1
    visit course_path(course.id)
    expect(page).not_to have_css "p", text: "Weights of all assessments                                do not sum 100%"
  end
end

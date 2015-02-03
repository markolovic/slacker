require 'rails_helper'

feature "Course show page displays current class grade" do
  scenario "successfully" do
    course = course_with_assessments # hardcodes course grade to 62
    visit course_path(course.id)
    expect(course.current_grade).to eq 0.62
    expect(page).to have_css "small", text: "62.0%"
  end
end

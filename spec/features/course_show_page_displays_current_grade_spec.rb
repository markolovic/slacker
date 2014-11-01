require 'rails_helper'

feature "Course show page displays current class grade" do
  scenario "successfully" do
    course = create(:course)
    visit course_path(course.id)
    expect(page).to have_css "small", text: course.current_grade
  end
end

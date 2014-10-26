require 'rails_helper'

feature "User creates new course" do
  scenario "successfully" do
    visit root_path
    click_on "My classes"
    click_on "Add new class"
    fill_in "Name", with: "MATH 1010"
    fill_in "Credits", with: 3
    click_on "Submit"
    expect(Course.last.name).to eq "MATH 1010"
    expect(current_path). to eq course_path(Course.last)
    expect(page).to have_css 'h2', text: Course.last.name
  end
end

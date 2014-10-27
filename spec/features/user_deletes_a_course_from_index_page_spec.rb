require 'rails_helper'

feature "User edits course list on index page", js: true do
  scenario "and deletes a course" do
    create(:course)
    create(:course, name: "PHIL 1020")
    visit root_path
    click_on "My classes" 
    expect(page).to have_css "li", text: "STAT 2300"
    expect(page).to have_css "li", text: "PHIL 1020"
    click_on "Delete a class"
    expect(page).to have_css "a.visible"
    expect(page).to have_css ".cross"
    within(:css, "li#course-name-1") do
      find('a.cross').click
    end
    expect(page).not_to have_css "li", text: "STAT 2300"
    expect(page).to have_css "li", text: "PHIL 1020"
  end

  scenario "and exits the edit mode without deleting a course" do
    create(:course)
    create(:course, name: "PHIL 1020")
    visit root_path
    click_on "My classes" 
    expect(page).to have_css "li", text: "STAT 2300"
    expect(page).to have_css "li", text: "PHIL 1020"
    click_on "Delete a class"
    expect(page).to have_css ".cross"
    click_link "Back"
    expect(page).not_to have_css ".cross"
  end
end

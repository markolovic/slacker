require 'rails_helper'

feature "User edits category list on course#show page", js: true do
  scenario "and deletes a category" do
    cat = create(:category)
    create(:category, name: "Midterm", reps: 1, course_id: cat.course_id)
    visit root_path
    click_on "My classes" 
    click_on "STAT 2300" 
    expect(page).to have_css "td", text: "Individual Assignments"
    expect(page).to have_css "td", text: "Midterm"
    click_on "Delete a category"
    expect(page).to have_css "a.visible"
    expect(page).to have_css ".cross"
    within(:css, "td#category-id-#{cat.id}") do
      find('a.cross').click
    end
    expect(page).not_to have_css "td", text: "Individual Assignments"
    expect(page).to have_css "td", text: "Midterm"
    expect(Category.first.name).not_to eq "Individual Assignments"
  end
end

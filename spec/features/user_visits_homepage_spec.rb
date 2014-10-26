require 'rails_helper'

feature "User visits homepage" do
  scenario "successfully" do
    visit root_path
    expect(page).to have_css 'h1', text: 'slacker'
  end
  scenario "Sees all courses" do
    visit root_path
    click_on "My classes"
    expect(current_path).to eq courses_path
    expect(page).to have_css 'li', text: Course.take.name
  end
end


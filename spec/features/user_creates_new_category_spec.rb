require 'rails_helper'

describe "User creates new category" do
  scenario "with one rep" do
    course = create(:course)
    visit root_path
    click_on "My classes"
    click_on Course.first.name
    click_on "Add new category" 
    expect(current_url).to match /.+categories\/new\?course_id=1/
    fill_in "Name", with: "Midterm 2"
    fill_in "Weight", with: 0.15
    fill_in "Reps", with: 1
    click_on "Create Category"
    expect(Category.last.name).to eq "Midterm 2"
    expect(Category.last.assessments.first.rep).to eq 1
    expect(current_path). to eq course_path(Category.last.course)
    expect(page).to have_css 'h2', text: Course.last.name
  end

  scenario "with multiple reps" do
    course = create(:course)
    visit root_path
    click_on "My classes"
    click_on Course.first.name
    click_on "Add new category" 
    expect(current_url).to match /.+categories\/new\?course_id=1/
    fill_in "Name", with: "Midterm 2"
    fill_in "Weight", with: 0.15
    fill_in "Reps", with: 5
    click_on "Create Category"
    expect(Category.last.name).to eq "Midterm 2"
    expect(Category.last.assessments.all.count).to eq 5
    expect(Category.last.assessments.last.rep).to eq 5
    expect(current_path). to eq course_path(Category.last.course)
    expect(page).to have_css 'h2', text: Course.last.name
  end
end


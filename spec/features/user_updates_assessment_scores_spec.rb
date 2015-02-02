require 'rails_helper'

feature "User updates assessments" do
  scenario "all" do
    pending
    #cat = create(:category)
    create_list(:assessment, 10)
    #expect(cat.assessments.count).to eq 5
    ass = Assessment.where(rep: 1)
    expect(ass.length).to eq 1
    expect(Assessment.first.rep).to eq 10
  end
end

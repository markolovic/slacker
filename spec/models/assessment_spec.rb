require 'rails_helper'

describe Assessment do

  it { should belong_to(:category) }
  it { should validate_presence_of(:category_id) } # necessary ?
  it { should validate_numericality_of(:rep) }

  it "should be valid" do
    #FactoryGirl.reload
    ass = build(:assessment)
    expect(ass.save).to eq true
    # expect(ass).to be_valid
  end

  context "should not be valid if" do
    it "rep is zero" do
      ass = build(:assessment, rep: 0)
      expect(ass.save).to eq false
    end
    it "rep is negative" do
      ass = build(:assessment, rep: -1)
      expect(ass.save).to eq false
    end
  end
end

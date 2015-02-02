require 'rails_helper'

describe Category, :type => :model do
  let(:cat) { build(:category) }
  subject { cat }
  it { is_expected.to be_valid } 
  context "should not save if" do
    it "reps < 1" do
      cat.reps = nil
      expect(cat).not_to be_valid
    end
    it "weight is not between 0 and 1" do
      cat.weight = -0.2
      expect(cat).not_to be_valid
      cat.weight = 2
      expect(cat).not_to be_valid
    end
    it "without associated course" do
      cat.course = nil
      expect(cat).not_to be_valid
    end
    it "name is not unique to its course" do
      create(:category, course_id: cat.course_id)
      expect(cat).not_to be_valid
    end
  end
end

describe Category, "#unit_weight" do
  context "weight > 0.15" do
    it "returns weight per rep" do
      cat = create(:category, weight: 0.2, reps: 1)      
      expect(cat.unit_weight).to eq 2 
    end
  end
  context "weight < 0.15" do
    it "returns weight per rep" do
      cat = create(:category, weight: 0.1, reps: 8)      
      expect(cat.unit_weight).to eq 1.25 
    end
  end
end

describe Category, "#name_pluralized" do
  it "pluralize name if reps > 1" do
    cat = create(:category)
    expect(cat.name_pluralized).to eq "Individual Assignments"
  end
  it "does not pluralize name if reps = 1" do
    cat = create(:midterm)
    expect(cat.name_pluralized).to eq cat.name
  end
end

describe Category, "#weight_percent" do
  it "returns formatted string" do
    cat = create(:category, weight: 0.3)
    expect(cat.weight_percent).to eq "30.0%"
  end
end



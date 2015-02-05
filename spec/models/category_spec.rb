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
    it "assessments are invalid" do
      cat.assessments.new(score: 2, rep: 1)
      expect(cat).not_to be_valid
    end
  end
  context "should save if" do
    it "assessments are valid" do
      cat.save
      cat.assessments.new(score: 1, rep: 1)
      expect(cat).to be_valid
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

describe Category, "#grade" do
  it "returns right grade" do
    cat = create(:category)
    10.times { |i|
      if i < 4
        cat.assessments.new(score: 0.5, rep: i+1, category: cat)
      elsif i >= 4 and i < 8
        cat.assessments.new(score: 0.7, rep: i+1, category: cat)
      else
        cat.assessments.new(rep: i+1, category: cat)
      end
    }
    cat.save
    expect(cat.assessments.all.size).to eq 10
    expect(cat.assessments.first.score).to eq 0.5
    expect(cat.assessments.last.score).to be_nil
    expect(cat.grade).to eq 0.6
    #TODO figure out setup system to DRY out and remove clutter
    #TODO replace with helper method from support/model_helper.rb
  end
  it "returns nil when no scores" do 
    cat = create(:category)
    create(:assessment, category: cat)
    expect(cat.grade).to eq nil
  end
end



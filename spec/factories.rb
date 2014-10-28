FactoryGirl.define do
  factory :category do
    name "Individual Assignment"
    weight 0.1
    course # for course factor :course
    reps 8
      #attendance false

    #factory :category_with_assessments do
      #reps 20
      #transient do
        #assessments_count 20
      #end

      #after(:create) do |category, evaluator|
        #create_list(:assessment, evaluator.reps, category: category)
      #end
    #end
  end

  factory :midterm, class: Category do
    name "Midterm 1"
    weight 0.2
    course # for course factor :course
    reps 1
      #attendance false
  end

  factory :course do
    name "STAT 2300"
    credits 3
  end

  factory :assessment do
    sequence :rep, 1
    category  # for category factory :category
  end

end
    

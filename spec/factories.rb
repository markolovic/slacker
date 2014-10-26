FactoryGirl.define do
  factory :category do
    #id 3
    name "Individual Assignment"
    weight 0.1
    course # for course factor :course
    reps 8
      #attendance false
  end

  factory :course do
    #id 2
    name "STAT 2300"
    credits 3
  end

  factory :assessment do
    rep 1
    category  # for category factory :category
      # score nil
  end
end
    

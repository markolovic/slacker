FactoryGirl.define do
  factory :category do
    name "Individual Assignment"
    weight 0.1
    course # for course factor :course
    reps 8
      #attendance false
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
    rep 1
    category  # for category factory :category
      # score nil
  end
end
    

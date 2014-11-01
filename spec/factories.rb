FactoryGirl.define do
  factory :category do
    name "Individual Assignment"
    weight 0.1
    course # for course factor :course
    reps 8
      #attendance false

    factory :category_with_assessments do
      reps 10
      name { generate(:category_name) }
      #transient do
        #assessments_count 20
      #end

      after(:create) do |category, evaluator|
        create_list(:assessment, evaluator.reps, category: category)
      end
    end
  end

  sequence :category_name do |n|
    "Category #{n}"
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

    factory :course_with_assessments do

      transient do
        categories_count 5
      end

      after(:create) do |course, evaluator|
        create_list(:category_with_assessments, 
                    evaluator.categories_count, 
                    course: course)
      end
    end

  end

  factory :assessment do
    sequence :rep, 1
    #sequence(:rep) { |n| n }
    category  # for category factory :category
  end

end
    

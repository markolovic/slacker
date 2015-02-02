class Assessment < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :category_id
  validates :rep, presence: true, numericality: {integer_only: true, 
                                                 greater_than_or_equal_to: 1 }
  validates :score, allow_nil: true, numericality: {greater_than_or_equal_to: 0,
                                   less_than_or_equal_to: 1 }
  #def name
    #target = Course.find(course_id).assessments.where(category: category)
             #.find_by_rep(2)
    #if target
      #"#{category.titleize} #{rep}"
    #else
      #"#{category.titleize}" 
    #end
  #end

  #def weight_percent
    #(weight*100).to_s + "%"
  #end

end

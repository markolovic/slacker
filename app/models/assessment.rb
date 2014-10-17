class Assessment < ActiveRecord::Base
  belongs_to :category


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

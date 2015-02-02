class Course < ActiveRecord::Base
  has_many :categories
  validates :name, presence: true
  validates :credits, presence: true

  def current_grade
    #Use inject to return accumulative var from block?
    sum = 0
    fullsum = 0
    categories.all.each_with_index do |cat, i|
      #cat.assessments.all.each_with_index do |ass, j|
        ## try to one-line. 
        #if ass.score
          #sum += ass.score
        #end
      #end
      #avg = sum / j
      #fullsum += avg
    end
    fullsum /= i
    #"current grade goes here"
  end
end


class Course < ActiveRecord::Base
  has_many :categories
  validates :name, presence: true
  validates :credits, presence: true

  def current_grade
    #Use inject to return accumulative var from block?
    sum = 0
    total = 1
    categories.all.each do |cat|
      unless cat.grade.nil?
        sum += cat.grade * cat.weight
      else
        total -= cat.weight
      end
    end
    #logger.debug "
    unless total == 0 || categories.all.size == 0
      sum /= total
    else
      return nil
    end
    #TODO refactor?
  end
end


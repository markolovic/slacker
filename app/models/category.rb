class Category < ActiveRecord::Base
  belongs_to :course
  has_many :assessments
  validates :name, presence: true
  validates :course_id, presence: true

  def weight_percent
    ((weight * 100).round(2)).to_s + "%"
  end

  def unit_weight
    uweight = weight * 100 / reps
    uweight
    uweight / 10 if uweight >= 15 
    #if uweight >= 0.15
      #((uweight* 10).round(2)).to_s + "%" + " (for 10 points)" 
    #else
      #((uweight* 100).round(2)).to_s + "%"
    #end
  end

  def name_pluralized
    if self.assessments.all.count > 1
      name.pluralize
    else
      name
    end
  end

end

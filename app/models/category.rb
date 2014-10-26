class Category < ActiveRecord::Base
  belongs_to :course
  has_many :assessments
  accepts_nested_attributes_for :assessments
  validates :name, presence: true, uniqueness: { scope: :course_id, 
                                                 message: "This course already has a category with that name" }
  validates :course_id, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 0, 
                                     less_than_or_equal_to: 1 }
  validates :reps, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1 }  

  def weight_percent
    ((weight * 100).round(2)).to_s + "%"
  end

  def unit_weight
    uweight = weight * 100 / reps
    if uweight >= 15 
      uweight /= 10
    end
    #if uweight >= 1.15
      #((uweight* 10).round(2)).to_s + "%" + " (for 10 points)" 
    #else
      #((uweight* 100).round(2)).to_s + "%"
    #end
  end

  def name_pluralized
    if reps > 1
      name.pluralize
    else
      name
    end
  end

end

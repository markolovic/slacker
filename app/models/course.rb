class Course < ActiveRecord::Base
  has_many :categories
  validates :name, presence: true
  validates :credits, presence: true

  def current_grade
    
  end
end

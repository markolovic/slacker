class Course < ActiveRecord::Base
  has_many :categories
  validates :name, presence: true
  validates :credits, presence: true

  def current_grade
    #categories.all.each do |cat|
    #end
    "current grade goes here"
  end
end

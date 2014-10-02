class Course < ActiveRecord::Base
  has_many :assessments
end

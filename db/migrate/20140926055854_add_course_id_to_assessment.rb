class AddCourseIdToAssessment < ActiveRecord::Migration
  def change
    add_column :assessments, :course_id, :integer
  end
end

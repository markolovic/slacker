class AddScoreToAssessment < ActiveRecord::Migration
  def change
    add_column :assessments, :score, :decimal
  end
end

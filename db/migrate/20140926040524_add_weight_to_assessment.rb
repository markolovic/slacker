class AddWeightToAssessment < ActiveRecord::Migration
  def change
    add_column :assessments, :weight, :decimal
  end
end

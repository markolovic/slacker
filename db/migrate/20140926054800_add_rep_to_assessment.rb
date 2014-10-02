class AddRepToAssessment < ActiveRecord::Migration
  def change
    add_column :assessments, :rep, :integer
  end
end

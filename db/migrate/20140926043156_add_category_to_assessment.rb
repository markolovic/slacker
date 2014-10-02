class AddCategoryToAssessment < ActiveRecord::Migration
  def change
    add_column :assessments, :category, :string
  end
end

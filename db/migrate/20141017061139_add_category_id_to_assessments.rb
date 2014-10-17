class AddCategoryIdToAssessments < ActiveRecord::Migration
  def up
    add_column :assessments, :category_id, :integer
    add_index :assessments, :category_id
    add_index :categories, :course_id
  end

  def down
    remove_index :categories, :course_id
    remove_index :assessments, :category_id
    remove_column :assessments, :category_id
  end
end

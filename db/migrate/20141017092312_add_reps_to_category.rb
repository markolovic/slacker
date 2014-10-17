class AddRepsToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :reps, :integer
  end

  def down
    remove_column :categories, :reps
  end
end

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :weight
      t.integer :course_id

      t.timestamps
    end
  end
end

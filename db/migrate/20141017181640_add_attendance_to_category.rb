class AddAttendanceToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :attendance, :boolean, default: false
  end

  def down
    remove_column :categories, :attendance
  end
end

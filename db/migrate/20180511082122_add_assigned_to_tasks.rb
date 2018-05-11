class AddAssignedToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :assignet_to, :integer
    add_column :tasks, :assignet_by, :integer
    add_column :tasks, :created_by, :integer
  end
end

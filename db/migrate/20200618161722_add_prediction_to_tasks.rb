class AddPredictionToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :prediction, :float
  end
end

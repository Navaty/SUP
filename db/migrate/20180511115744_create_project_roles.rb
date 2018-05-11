class CreateProjectRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :project_roles do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :role

      t.timestamps
    end
  end
end

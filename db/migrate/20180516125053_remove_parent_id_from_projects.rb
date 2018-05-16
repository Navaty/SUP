class RemoveParentIdFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :parent_id, :integer
  end
end

class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :project_id
      t.integer :assignet_to
      t.boolean :status

      t.timestamps
    end
  end
end

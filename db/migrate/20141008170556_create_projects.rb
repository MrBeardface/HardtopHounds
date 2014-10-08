class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.text :title
      t.string :description
      t.integer :user_id
      t.timestamps
    end
    add_index :projects, [:user_id, :created_at]
  end
end

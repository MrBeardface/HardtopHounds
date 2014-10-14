class CreateFavoriteProjects < ActiveRecord::Migration
  def change
    create_table :favorite_projects do |t|
    	t.integer :user_id
    	t.integer :project_id
      t.timestamps
    end
    add_index :favorite_projects, [:user_id]
    add_index :favorite_projects, [:project_id]
  end
end

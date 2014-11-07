class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.text :image
    	t.integer :user_id
    	t.integer :project_id
      t.timestamps
    end
     add_index :photos, [:project_id, :user_id]
  end
end

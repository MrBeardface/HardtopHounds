class CreateFavoriteBlogs < ActiveRecord::Migration
  def change
    create_table :favorite_blogs do |t|
			t.integer :user_id
    	t.integer :blog_id
      t.timestamps
    end
    add_index :favorite_blogs, [:user_id]
    add_index :favorite_blogs, [:blog_id]
  end
end

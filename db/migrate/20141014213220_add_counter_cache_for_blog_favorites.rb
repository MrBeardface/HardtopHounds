class AddCounterCacheForBlogFavorites < ActiveRecord::Migration
  def change
  	add_column :users, :favorite_blogs_count, :integer, null: false, default: 0
  	add_column :blogs, :favorite_blogs_count, :integer, null: false, default: 0
  end
end

class AddBlogCounterCachetoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :blogs_count, :integer, null: false, default: 0
  end
end

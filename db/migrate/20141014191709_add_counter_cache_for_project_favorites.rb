class AddCounterCacheForProjectFavorites < ActiveRecord::Migration
  def change
  	add_column :users, :favorite_projects_count, :integer, null: false, default: 0
  	add_column :projects, :favorite_projects_count, :integer, null: false, default: 0
  end
end

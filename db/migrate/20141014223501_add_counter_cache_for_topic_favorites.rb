class AddCounterCacheForTopicFavorites < ActiveRecord::Migration
  def change
  	add_column :users, :favorite_topics_count, :integer, null: false, default: 0
  	add_column :topics, :favorite_topics_count, :integer, null: false, default: 0
  end
end

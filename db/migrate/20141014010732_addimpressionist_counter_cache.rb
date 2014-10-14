class AddimpressionistCounterCache < ActiveRecord::Migration
  def change
  	add_column :projects, :project_views, :integer, null: false, default: 0
  	add_column :topics, :topic_views, :integer, null: false, default: 0
  	add_column :blogs, :blog_views, :integer, null: false, default: 0
  	add_column :forums, :forum_views, :integer, null: false, default: 0
  end
end

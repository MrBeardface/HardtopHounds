class AddProjectsCountToJournals < ActiveRecord::Migration
  def change
  	add_column :journals, :projects_count, :integer, null: false, default: 0
  end
end

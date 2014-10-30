class AddJournalIdToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :journal_id, :integer, null: false, default: 0
  end
end

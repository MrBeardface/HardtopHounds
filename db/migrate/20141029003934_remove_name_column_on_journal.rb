class RemoveNameColumnOnJournal < ActiveRecord::Migration
  def change
  	remove_column :journals, :name, :text
  end
end

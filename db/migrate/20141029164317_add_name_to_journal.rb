class AddNameToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :name, :string
  end
end

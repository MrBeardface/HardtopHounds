class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.text :website
    	t.text :profile
    	t.text :avatar
    	t.integer :user_id
      t.timestamps
    end
    add_index :profiles, [:user_id]
  end
end

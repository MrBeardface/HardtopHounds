class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
			t.text :title
      t.string :description
      t.integer :user_id
      t.integer :forum_id
      t.timestamps
    end
    add_index :topics, [:user_id, :forum_id, :created_at]
  end
end

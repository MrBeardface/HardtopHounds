class CreateFavoriteTopics < ActiveRecord::Migration
  def change
    create_table :favorite_topics do |t|
			t.integer :user_id
    	t.integer :topic_id
      t.timestamps
    end
    add_index :favorite_topics, [:user_id]
    add_index :favorite_topics, [:topic_id]
  end
end

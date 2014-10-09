class RemoveUserIdFromForums < ActiveRecord::Migration
  def change
    remove_column :forums, :user_id, :integer
  end
end

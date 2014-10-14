class Project < ActiveRecord::Base
	belongs_to :user, counter_cache: true
	has_many :favorite_projects

	is_impressionable :counter_cache => true, :column_name => :project_views

	default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  
  def favorited_by(user=nil)
    favorite_projects.find_by(user_id: user.id) unless user == nil
  end
end

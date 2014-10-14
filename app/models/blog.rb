class Blog < ActiveRecord::Base
	belongs_to :user, counter_cache: true
	has_many :favorite_blogs

	is_impressionable :counter_cache => true, :column_name => :blog_views

	default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true

  def favorited_by(user=nil)
    favorite_blogs.find_by(user_id: user.id) unless user == nil
  end
end

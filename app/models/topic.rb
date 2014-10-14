class Topic < ActiveRecord::Base
	belongs_to :forum, counter_cache: true
	belongs_to :user, counter_cache: true
	is_impressionable :counter_cache => true, :column_name => :topic_views

	# accepts_nested_attributes_for :forum

	default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :forum_id, presence: true
end

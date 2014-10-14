class Forum < ActiveRecord::Base
	has_many :topics
	is_impressionable :counter_cache => true, :column_name => :forum_views

	accepts_nested_attributes_for :topics

	validates :name, presence: true, length: {maximum: 50}

	def forum_name
		"#{name}"
	end
end

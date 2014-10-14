class FavoriteBlog < ActiveRecord::Base
	belongs_to :user, counter_cache: true
	belongs_to :blog, counter_cache: true
end

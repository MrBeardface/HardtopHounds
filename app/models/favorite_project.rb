class FavoriteProject < ActiveRecord::Base
	belongs_to :user, counter_cache: true
	belongs_to :project, counter_cache: true
end

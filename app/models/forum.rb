class Forum < ActiveRecord::Base
	has_many :topics

	accepts_nested_attributes_for :topics

	validates :name, presence: true, length: {maximum: 50}

	def forum_name
		"#{name}"
	end
end

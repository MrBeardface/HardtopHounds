class Project < ActiveRecord::Base
	belongs_to :user, counter_cache: true

	default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
end

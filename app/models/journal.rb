class Journal < ActiveRecord::Base
	has_many :projects
	belongs_to :user

	accepts_nested_attributes_for :projects

	validates :name, presence: true, length: {maximum: 50}
	validate :check_unique_name

  def check_unique_name
  	@name_added = Journal.where(name: name, user: user_id).exists?
  	errors.add(:base, "Error Message") if @name_added
  end

  def things
  	self.name + " (#{self.projects_count} projects)"
 	end
end
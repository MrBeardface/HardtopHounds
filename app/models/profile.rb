class Profile < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	belongs_to :user
	validate :avatar,
	:file_size => { 
      :maximum => 1.megabytes.to_i 
    } 
end

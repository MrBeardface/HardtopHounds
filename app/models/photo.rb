class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	mount_uploader :image, ImageUploader

	validate :image, 
    :file_size => { 
      :maximum => 5.megabytes.to_i 
    } 
end
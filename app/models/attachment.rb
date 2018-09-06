class Attachment < ApplicationRecord
	#Mounts paperclip image
  	has_attached_file :image
  	belongs_to :attachable, polymorphic: true
end

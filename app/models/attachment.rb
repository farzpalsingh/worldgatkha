class Attachment < ApplicationRecord
	belongs_to :attachable, polymorphic: true
	#Mounts paperclip image
  	has_attached_file :attachment
  	validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
end

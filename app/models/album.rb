class Album < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: :slugged
	validates :title, presence: true, uniqueness: true
	has_many :attachments, as: :attachable, dependent: :destroy
end

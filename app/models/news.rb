class News < ApplicationRecord
	validates :title, :description, :datetime , presence: true
	has_many :attachments, as: :attachable, dependent: :destroy
end

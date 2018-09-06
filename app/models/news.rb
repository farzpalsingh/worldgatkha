class News < ApplicationRecord
	validates :title, :description, :datetime , presence: true
	has_one :attachment, as: :attachable, dependent: :destroy
end

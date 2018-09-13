class GalleryVideo < ApplicationRecord
	validates :title, :video_url, presence: true

end

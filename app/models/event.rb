class Event < ApplicationRecord
	validates :title, :description, :datetime, :video_url, presence: true

	def getYoutubeId(url)
		regex = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/
    	match = regex.match url.to_str
    	if match && !match[1].blank?
    		match[1]
    	end
	end

	def embedUrl
		youtube_id = getYoutubeId(self.video_url)
		youtube_embed = %(<iframe src='https://www.youtube.com/embed/#{youtube_id}?rel=0&autoplay=false' frameborder='0' allowfullscreen></iframe>)
        youtube_embed.html_safe
	end

	# def embedUrl
	# 	embed_url = self.video_url.gsub('watch?v=','embed/')
	# 	youtube_embed = %(<iframe src='#{embed_url}?rel=0&autoplay=false' frameborder='0' allowfullscreen></iframe>)
 #        youtube_embed.html_safe
	# end
end

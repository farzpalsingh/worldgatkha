class GalleryController < ApplicationController
	before_action :authenticate_user!, :except => [:images, :videos]
	layout false, :except => [:images, :videos]
  	layout 'admin', :except => [:images, :videos]
	
	# def images
	# end

	def videos
		@gallery_videos = GalleryVideo.all
	end

	# Gallery Video

	def indexVideos
		@gallery_videos = GalleryVideo.all
	end

	def newVideo
		@gallery_video = GalleryVideo.new
	end

	def editVideo
		@gallery_video = GalleryVideo.find(params[:id])
	end

	def createVideo
		@gallery_video = GalleryVideo.new(video_params)
		match = checkMatch(params[:gallery_video][:video_url])
    	if match && !match[1].blank?
			if @gallery_video.save
				redirect_to admin_gallery_all_videos_path
			else
				render 'newVideo'
			end
		else
			render 'newVideo'
		end
	end

	def updateVideo	
		@gallery_video = GalleryVideo.find(params[:id])
    	match = checkMatch(params[:gallery_video][:video_url])
    	if match && !match[1].blank?
			if @gallery_video.update(video_params)
				redirect_to admin_gallery_all_videos_path
			else
				render 'editVideo'
			end
		else
			render 'editVideo'
		end
	end

	def destroyVideo
		@gallery_video = GalleryVideo.find(params[:id])
		@gallery_video.destroy
		redirect_to admin_gallery_all_videos_path
	end

	def checkMatch(url)
		regex = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/
    	match = regex.match (url).to_str
    	match
	end

	private
		def video_params
			params.require(:gallery_video).permit(:title, :video_url)
		end
end

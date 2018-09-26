class AlbumsController < ApplicationController
	before_action :authenticate_user!, :except => [:indexAlbum, :indexAlbumImages]
	layout false, :except => [:indexAlbum, :indexAlbumImages]
  	layout 'admin', :except => [:indexAlbum, :indexAlbumImages]

	def index
		@albums = Album.all
	end

	def indexAlbum
		@albums = Album.all
	end

	def indexAlbumImages
		@album = Album.friendly.find(params[:id])
	end

	def show
		@album = Album.friendly.find(params[:id])
	end

	def new
		@album = Album.new
	end

	def edit
		@album = Album.friendly.find(params[:id])
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			if params[:album][:attachment].present?
				params[:album][:attachment].each do |attachment|
					@attachment = @album.attachments.create(attachment: attachment)
				end
				# @attachment = @album.attachments.create(attachment_params)
			end
			redirect_to admin_gallery_all_albums_path
			flash[:notice] = "Album saved successfully"
		else
			render 'new'
			flash[:errors] = @album.errors.full_messages
		end
	end

	def update
		@album = Album.friendly.find(params[:id])
		if @album.update(album_params)
			if params[:album][:attachment].present?
				params[:album][:attachment].each do |attachment|
					@attachment = @album.attachments.create(attachment: attachment)
				end
				# @attachment = @album.attachments.create(attachment_params)
			end
			redirect_to edit_admin_gallery_album_path(@album)
			flash[:notice] = "Album updated successfully"
		else
			render 'edit'
			flash[:errors] = @album.errors.full_messages
		end
	end

	def destroy
		@album = Album.friendly.find(params[:id])
		@album.destroy
		redirect_to admin_gallery_all_albums_path
		flash[:notice] = "Album deleted successfully"
	end

	def deleteAlbumImage
		@album = Album.find(params[:album_id])
		@attachment = @album.attachments.find(params[:id])
		@attachment.destroy
		redirect_to admin_gallery_album_path(@album)		
		flash[:notice] = "Image deleted successfully"
	end

	private
		def album_params
			params.require(:album).permit(:title)
		end

		def attachment_params
			params.require(:album).permit(:attachment)
		end

end

class AttachmentsController < ApplicationController

	def create
	    @attachment = Attachments.create(attachment_params)
	    if @attachment.save
	    	redirect_to admin_all_news_path
		else
			render 'news/new'
		end	    
	end

	private
		def attachment_params
			params.require(:attachment).permit(:title, :image)
		end

end

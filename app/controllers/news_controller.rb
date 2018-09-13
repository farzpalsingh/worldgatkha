class NewsController < ApplicationController
	before_action :authenticate_user!, :except => [:newsDetail]
	# before_action :authenticate_user!, :except => [:show, :index]
	layout false, :except => [:newsDetail]
  	layout 'admin', :except => [:newsDetail]

	def index
		@news = News.all
	end

	# def show
	# 	@news = News.find(params[:id])
	# end

	def newsDetail
		@news = News.find(params[:id])
	end

	def new
		@news = News.new
	end

	def edit
		@news = News.find(params[:id])
	end

	def create
		@news = News.new(news_params)
		# @news.attachment.new
		if @news.save
			if params[:attachment].present?
				@attachment = @news.attachments.create(attachment_params)
			end
			
			redirect_to admin_all_news_path
		else
			render 'new'
		end
	end

	def update
		@news = News.find(params[:id])
		if @news.update(news_params)
			if params[:attachment].present?
				@attachment = @news.attachments.find(params[:news][:attachments][:attachment_id])
				@attachment.update(attachment_params)
			end
			redirect_to admin_all_news_path
		else
			render 'edit'
		end
	end

	def destroy
		@news = News.find(params[:id])
		@news.destroy
		redirect_to admin_all_news_path
	end

	private
		def news_params
			params.require(:news).permit(:title, :description, :datetime, :is_active)
		end

		def attachment_params
			params.require(:news).require(:attachments).permit(:attachment)
		end
end

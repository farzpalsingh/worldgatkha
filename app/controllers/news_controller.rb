class NewsController < ApplicationController
	before_action :authenticate_user!
	layout false
  	layout 'admin'

	def index
		@news = News.all
	end

	def new
		@news = News.new
	end

	def create
		@news = News.new(news_params)
		if @news.save
			#@attachment = @news.attachment.create
			redirect_to admin_all_news_path
		else
			render 'new'
		end
	end

	private
		def news_params
			params.require(:news).permit(:title, :description, :datetime, :is_active)
		end
end

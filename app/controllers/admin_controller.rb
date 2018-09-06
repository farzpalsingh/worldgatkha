class AdminController < ApplicationController
	before_action :authenticate_user!
	layout false
  	layout 'admin'
	def index
		
	end
end

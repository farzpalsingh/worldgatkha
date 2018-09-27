class ContactUsController < ApplicationController
	def index
	end

	def create
		if ContactMailer.contact_admin(params.require(:contact).permit(:name, :email, :subject, :message)).deliver_now
	    	redirect_to contact_us_path, notice: "Message Sent"
	    else
	    	render 'index'
	    end
	end

	# private
	# 	def contact_params
	# 		params.require(:contact).permit(:name, :email, :subject, :message)
	# 	end
end

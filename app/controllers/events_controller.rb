class EventsController < ApplicationController
	before_action :authenticate_user!, :except => [:index_show, :eventDetail]
	layout false, :except => [:index_show, :eventDetail]
  	layout 'admin', :except => [:index_show, :eventDetail]

	def index
		@events = Event.all
	end

	def index_show
		@events = Event.all
	end

	def eventDetail
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def edit
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		match = checkMatch(params[:event][:video_url])
    	if match && !match[1].blank?
			if @event.save
				redirect_to admin_all_events_path
				flash[:notice] = "Event saved successfully"
			else
				render 'new'
				flash[:errors] = @event.errors.full_messages
			end
		else
			render 'new'
			flash[:alert] = "Enter valid Youtube Url"
		end
	end

	def update
		@event = Event.find(params[:id])
		match = checkMatch(params[:event][:video_url])
    	if match && !match[1].blank?
			if @event.update(event_params)
				redirect_to admin_all_events_path
				flash[:notice] = "Event updated successfully"
			else
				render 'edit'
				flash[:errors] = @event.errors.full_messages
			end
		else
			render 'edit'
			flash[:alert] = "Enter valid Youtube Url"
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to admin_all_events_path
		flash[:notice] = "Event deleted successfully"
	end

	def checkMatch(url)
		regex = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/
    	match = regex.match (url).to_str
    	match
	end

	private
		def event_params
			params.require(:event).permit(:title, :description, :datetime, :video_url)
		end
end

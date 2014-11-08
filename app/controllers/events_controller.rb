class EventsController < ApplicationController	

	def index
		@events = Event.all
		
		@hash = Gmaps4rails.build_markers(@events) do |event, marker|
  			marker.lat event.to_coordinates.first
  			marker.lng event.to_coordinates.last
		end 

	end

	def show
		@event = Event.find(params[:id])	
				@hash = Gmaps4rails.build_markers(@event) do |event, marker|
  			marker.lat event.to_coordinates.first
  			marker.lng event.to_coordinates.last
		end

	end

	def new
		@event = Event.new
	end

	def create	
	    @event = Event.new(params.require(:event).permit(:full_address, :user_id, :date, :time, :title, :address, :city, :state, :zip, :desc, :latitude, :longitude))
	    @event.user_id = current_user.id.to_s

	 
		
	    if @event.save
	        redirect_to events_path
	     else
	        render 'new'
	    end
	end

	def edit
		@event = Event.find(params[:id])
	end

   def update  	
    @event = Event.find(params[:id])
 	# @date =  @event["date(1i)"].to_i, @event["date(2i)"].to_i, @event["date(3i)"].to_i
	    if @event.update_attributes(params.require(:event).permit(:full_address, :title, :date, :time, :address, :city, :state, :zip, :desc, :latitude, :longitude))
	        redirect_to events_path
	     else
	        render 'edit'
	    end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end

	
	
end

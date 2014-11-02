class EventsController < ApplicationController	

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])		
	end

	def new
		@event = Event.new
	end

	def create	
	    @event = Event.new(params.require(:event).permit(:date, :time, :title, :address, :city, :state, :zip, :desc))
	    # @date =  @event["date(1i)"].to_i, @event["date(2i)"].to_i, @event["date(3i)"].to_i
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
	    if @event.update_attributes(params.require(:event).permit(:title, :date, :time, :address, :city, :state, :zip, :desc))
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

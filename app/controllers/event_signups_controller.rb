class EventSignupsController < ApplicationController
    
    before_action :authorize, :only => [:destroy] # only allow a user to delete his own event signups
    
    # Only allow the user who created the event to delete an event signup
    def authorize
        @eventsignup = Eventsignup.find_by(id: params["id"])
        @user = User.find_by(id: @eventsignup.user_id)
        if @user.blank? || session[:user_id] != @user.id
          redirect_to events_url, notice: "You can only delete your own event signups!"
        end
    end 
    
    #Create a new event signup
    def create
        @eventsignup = Eventsignup.new
        @user_id = User.find_by(id: session["user_id"])
        @event_id = @params["id"]
        if @eventsignup.save
            redirect_to "/events/#{@event_id}", notice: "Thanks for signing up to this event."
        else 
            render "/events/", notice: "Error"
        end
    end
    
    #Delete event signup from database
    def destroy
        @eventsignup.delete
        redirect_to events_url, notice: "Event signup deleted."
    end
    
end

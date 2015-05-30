class EventsignupsController < ApplicationController
    
    before_action :require_user, :only => [:create, :destroy]
    before_action :authorize, :only => [:create, :destroy] # only allow a user to create and delete his own event signups
    
    # Only allow the user who created the event to delete an event signup
    def authorize
        @eventsignup = EventSignup.find_by(id: params["id"])
        @user = User.find_by(id: @eventsignup.user_id)
        if @user.blank? || session[:user_id] != @user.id
          redirect_to events_url, notice: "You can only delete your own event signups!"
        end
    end 

    def require_user
      if session[:user_id].blank?
        redirect_to events_url, notice: "You need to login to do that."
      end
    end
    
    #Create a new event signup
    def create
        @eventsignup = EventSignup.new
        @user_id = User.find_by(id: session["user_id"]).id
        @event_id = @params["event_id"]
        if @eventsignup.save
            redirect_to "/events/#{@event_id}", notice: "Thanks for signing up to this event."
        else 
            render "/events", notice: "Error."
        end
    end
    
    #Delete event signup from database
    def destroy
        @eventsignup.delete
        redirect_to events_url, notice: "Event signup deleted."
    end
    
end

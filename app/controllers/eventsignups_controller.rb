class EventsignupsController < ApplicationController
    
    before_action :require_user, :only => [:create, :destroy]
    before_action :authorize, :only => [:destroy] # only allow a user to delete his own event signups
    
    # Only allow the user who created the event to delete an event signup
    def authorize
        @user_ids = EventSignup.where(event_id: params["event_id"]).pluck(:user_id)
        if @user_ids.blank? || !@user_ids.include?(session[:user_id])
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
        @eventsignup.user_id = User.find_by(id: session["user_id"]).id
        @eventsignup.event_id = params["event_id"]
        if @eventsignup.save
            redirect_to "/events/#{@eventsignup.event_id}", notice: "Thanks for signing up to this event."
        else 
            render "/events", notice: "Error."
        end
    end
    
    #Delete event signup from database
    def destroy
        @eventsignup = EventSignup.find_by(event_id: params["event_id"], user_id: session[:user_id])
        @eventsignup.delete
        redirect_to "/events/#{@eventsignup.event_id}", notice: "Event signup deleted."
    end
    
end

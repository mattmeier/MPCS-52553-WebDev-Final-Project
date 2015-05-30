class EventsController < ApplicationController
    
    before_action :authorize, :only => [:edit, :update, :destroy] # only allow index and show for users who did not create the event, but not edit, update and destroy
    before_action :find_event, :only => [:show, :edit, :update, :destroy]
    
    # Only allow the user who created the event to edit, update and destroy it
    def authorize
        @event = Event.find_by(id: params["id"])
        @user = User.find_by(id: @event.creator_id)
        if @user.blank? || session[:user_id] != @user.id
          redirect_to events_url, notice: "Nice try!"
        end
    end 

    def find_event
        @event = Event.find_by(id: params["id"])
    end
    
    #Retrieve and display info of all events
    def index
        if params["keyword"].present?
            location_ids = Location.where("city LIKE ?", "%#{params["keyword"]}")
            @events = Event.where(:location_id => location_ids)
            @event_count = @events.count
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @events = Event.limit(100).offset((params["page"].to_i - 1) * 100)
            @events = @events.order('name asc')
            @event_count = @events.count
        else
            @page = 2
            @events = Event.limit(100)
            @events = @events.order('name asc')
            @event_count = @events.count
        end
    end
    
    #Create a new event and insert the new user into table, based on input parameters
    def create
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        @event = Event.new
        @creator = User.find_by(id: session["user_id"])
        @event.creator_id = @creator.id #track who created the event; only this user can edit and delete it
        @event.name = params[:name]
        @event.university_id = University.find_by(:name => params[:university]).id
        @event.location_id = Location.find_by(:city => params[:location]).id
        @event.address = params[:address]
        @event.start_time = DateTime.strptime(params[:start_time], '%m/%d/%Y %I:%M %p')
        @event.end_time = DateTime.strptime(params[:end_time], '%m/%d/%Y %I:%M %p')
        @event.description = params[:description]
        @event.organizer_contact_email = @creator.email
        if @event.save
            # first also make sure that the creator also gets signed up for his own event
            @eventsignup = Eventsignup.new
            @user_id = @creator.id
            @event_id = @event.id
            @eventsignup.save
            # now redirect
            redirect_to events_url, notice: "Thanks for adding this new event."
        else
            render "new"
        end
    end
    
    #Show event details
    def show
        if @event == nil
            redirect_to events_url, notice: "Event not found."
        else 
            user_ids = EventSignup.where(event_id: @event.id).limit(1000).pluck(:user_id) # we do not expect more than 1000 people to sign up for an event
            @users = User.where(id: user_ids) 
            @logged_in_user_attending = @users.include?(User.find_by(id: session["user_id"])) 
        end
    end
    
    #Edit the Event's details
    def edit
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
    end
    
    def new
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        @event = Event.new
        render "new"
    end
    
    #Update the database
    def update
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        @event.creator_id = User.find_by(id: session["user_id"]).id #tracks who created the event; only this user can edit and delete it
        @event.name = params[:name]
        @event.university_id = University.find_by(:name => params[:university]).id
        @event.location_id = Location.find_by(:city => params[:location]).id
        @event.address = params[:address]
        @event.start_time = params[:start_time]
        @event.end_time = params[:end_time]
        @event.description = params[:description]
        @event.organizer_contact_email = params[:organizer_contact_email]
        if @event.save
            redirect_to event_url, notice: "Successfully edited event information."
        else
            render "edit"
        end
    end
    
    #Delete event from database
    def destroy
        @event.delete
        redirect_to events_url, notice: "Event deleted."
    end
    
end

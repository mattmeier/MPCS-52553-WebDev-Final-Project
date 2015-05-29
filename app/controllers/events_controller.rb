class EventsController < ApplicationController
    
    before_action :find_event, :only => [:show, :edit, :update, :destroy]
    
    def find_event
        @event = Event.find_by(id: params["id"])
    end
    
    #Retrieve and display info of all events
    def index
        if params["keyword"].present?
            location_ids = Location.where("city LIKE ?", "%#{params["keyword"]}")
            @events = Event.where(:location_id => location_ids)
        elsif params["page"].present?
            @events = Event.limit(100).offset((params["page"].to_i - 1) * 100)
            @events = @events.order('name asc')
        else
            @events = Event.limit(100)
            @events = @events.order('name asc')
        end
    end
    
    #Create a new event and insert the new user into table, based on input parameters
    def create
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        @event = Event.new
        @event.name = params[:name]
        @event.university_id = University.find_by(:name => params[:university]).id
        @event.location_id = Location.find_by(:city => params[:location]).id
        @event.address = params[:address]
        @event.start_time = DateTime.strptime(params[:start_time], '%m/%d/%Y %I:%M %p')
        @event.end_time = DateTime.strptime(params[:end_time], '%m/%d/%Y %I:%M %p')
        @event.description = params[:description]
        @event.organizer_contact_email = params[:organizer_contact_email]
        if @event.save
            redirect_to events_url, notice: "Thanks for adding this new event."
        else
            render "new"
        end
    end
    
    #Show event details
    def show
        cookies["event_id"] = @event.id
        
        if @event == nil
            redirect_to events_url, notice: "Event not found."
        end
    end
    
    #Edit the Event's details
    def edit
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
    end
    
    def new
        cookies.delete("event_id")
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        @event = Event.new
        render "new"
    end
    
    #Update the database
    def update
        @event = Event.new
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
        redirect_to events_url
    end
    
end

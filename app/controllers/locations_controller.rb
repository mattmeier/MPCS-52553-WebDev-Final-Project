class LocationsController < ApplicationController
    
    before_action :find_location, :only => [:show, :edit, :update, :destroy]
    
    def find_location
        @location = Location.find_by(id: params["id"])
    end
    
    #Retrieve and display info of all locations
    def index
        if params["keyword"].present?
            @locations = Location.where("city LIKE ?", "%#{params["keyword"]}")
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @locations = Location.limit(100).offset((params["page"].to_i - 1) * 100)
            @locations = @locations.order('city asc')
            @location_count = @locations.count
        else
            @page = 2
            @locations = Location.limit(100)
            @locations = @locations.order('city asc')
            @location_count = @locations.count
        end
    end
    
    #Create a new location and insert the new user into table, based on input parameters
    def create
        @location = Location.new
        @location.city = params[:city]
        @location.state = params[:state]
        @location.description = params[:description]
        if @location.save
            redirect_to locations_url, notice: "Thanks for adding a new location."
        else
            render "new"
        end
    end
    
    #Show location details
    def show
        @location = Location.find_by(id: params[:id])
        @users =  User.where(location_id: params[:id]).order('name')
        if @location == nil
            redirect_to locations_url, notice: "Location not found."
        end
    end
    
    def new
        @location = Location.new
        render "new"
    end

    # NOTE: WE DECIDED TO NOT ALLOW FOR EDITS AND DELETES ANY MORE AFTER CREATION!
    #Edit the Location's details
    def edit
    end
    
    #Update the database
    def update
        #@location.city = params[:city]
        #@location.state = params[:state]
        #@location.description = params[:description]
        #if @location.save
        #    redirect_to location_url, notice: "Successfully edited location information."
        #else
        #    render "edit"
        #end
    end
    
    #Delete location from database
    def destroy
        #@location.delete
        #redirect_to locations_url
    end
    
end
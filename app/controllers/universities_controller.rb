class UniversitiesController < ApplicationController
    
    before_action :find_university, :only => [:show, :edit, :update, :destroy]
    
    def find_university
        @university = University.find_by(id: params["id"])
    end
    
    #Retrieve and display info of all universitys
    def index
        if params["keyword"].present?
            @universities = University.where("name LIKE ?", "%#{params["keyword"]}")
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @universities = University.limit(100).offset((params["page"].to_i - 1) * 100)
            @universities = @universities.order('name asc')
            @university_count = @universities.count
        else
            @page = 2
            @universities = University.limit(100)
            @universities = @universities.order('name asc')
            @university_count = @universities.count
        end
    end
    
    #Create a new university and insert the new user into table, based on input parameters
    def create
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        @university = University.new
        @university.name = params[:name]
        @university.description = params[:description]
        @university.logo_url = params[:logo_url]
        @university.location_id = Location.find_by(:city => params[:location]).id
        if @university.save
            redirect_to universities_url, notice: "Thanks for adding this new university."
        else
            render "new"
        end
    end
    
    #Show university details
    def show
        @university = University.find_by(id: params[:id])
        @users =  User.where(university_id: params[:id]).order('name')
        if @university == nil
            redirect_to universities_url, notice: "University not found."
        end
    end
    
    #Edit the University's details
    def edit
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
    end
    
    def new
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        @university = University.new
        render "new"
    end
    
    #Update the database
    def update
        @university.name = params[:name]
        @university.location_id = Location.find_by(:city => params[:location]).id
        @university.description = params[:description]
        @university.logo_url = params[:logo_url]
        if @university.save
            redirect_to university_url, notice: "Successfully edited university information."
        else
            render "edit"
        end
    end
    
    #Delete university from database
    def destroy
        @university.delete
        redirect_to universities_url
    end
    
end

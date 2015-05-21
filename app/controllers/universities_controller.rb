class UniversitiesController < ApplicationController
    
    before_action :find_university, :only => [:show, :edit, :update, :destroy]
    
    def find_university
        @university = University.find_by(id: params["id"])
    end
    
    #Retrieve and display info of all universitys
    def index
        if params["keyword"].present?
            @universities = University.where("name LIKE '%#{params["keyword"]}%'")
        else
            @universities = University.all
            @universities = University.order('name asc')
        end
    end
    
    #Create a new university and insert the new user into table, based on input parameters
    def create
        @university = University.new
        @university.name = params[:name]
        @university.color = params[:color]
        @university.location_id = Location.find_by(:city => params[:location]).id
        if @university.save
            redirect_to universities_url, notice: "Thanks for adding this new university."
        else
            render "new"
        end
    end
    
    #Show university details
    def show
        cookies["university_id"] = @university.id
        @university = University.find_by(id: params[:id])
        @users =  User.where(university_id: params[:id]).order('name')
        if @university == nil
            redirect_to universities_url, notice: "University not found."
        end
    end
    
    #Edit the University's details
    def edit
        @locations = Location.all
    end
    
    def new
        cookies.delete("university_id")
        @university = University.new
        render "new"
    end
    
    #Update the database
    def update
        @university.name = params[:name]
        @university.color = params[:color]
        @university.location_id = Location.find_by(:city => params[:location]).id
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

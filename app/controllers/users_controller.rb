class UsersController < ApplicationController
    
    before_action :find_user, :only => [:show, :edit, :update, :destroy]
    
    def find_user
        @user = User.find_by(id: params["id"])
    end
    
    #Retrieve and display main info of all users
    def index
        if params["keyword"].present?
            @users = User.where("name LIKE '%#{params["keyword"]}%'")
        else
            @users = User.all
            @users = User.order('name asc')
        end
        @universities = University.all
        @locations = Location.all
    end
    
    #Create a new user and insert the new user into table, based on input parameters
    def create
        @universities = University.all
        @locations = Location.all
        
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        #Search database to find the corresponding university id for name entered by user
        @user.university_id = University.find_by(:name => params[:university]).id
        @user.graduation_year = params[:graduation_year]
        @user.major = params[:major]
        @user.bio = params[:bio]
        #Search database to find the corresponding location id for name entered by user
        @user.location_id = Location.find_by(:city => params[:location]).id
        hosting = params[:interested_in_hosting]
        if hosting == "hosting"
            hosting = "yes"
        else
            hosting = "no"
        end
        @user.interested_in_hosting = hosting
        hanging = params[:interested_in_hanging_out]
        if hanging == "hanging_out"
            hanging = "yes"
        else
            hanging = "no"
        end
        @user.interested_in_hanging_out = hanging
        
        #Save and redirect to homepage after all details have been entered and user clicks submission button
        if @user.save
            redirect_to root_url, notice: "Thanks for signing up."
        else
            render "new"
        end
    end
    
    #Show user details
    def show
        cookies["user_id"] = @user.id
        
        if @user == nil
            redirect_to users_url, notice: "User not found."
        end
    end
    
    #Edit the user's details
    def edit
        @universities = University.all
        @locations = Location.all
    end
    
    def new
        cookies.delete("user_id")
        @user = User.new
        @universities = University.all
        @locations = Location.all
        render "new"
    end
    
    #Update the database
    def update
        @universities = University.all
        @locations = Location.all
    
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        #Search database to find the corresponding university id for name entered by user
        @user.university_id = University.find_by(:name => params[:university]).id
        @user.graduation_year = params[:graduation_year]
        @user.major = params[:major]
        @user.bio = params[:bio]
        #Search database to find the corresponding location id for name entered by user
        @user.location_id = Location.find_by(:city => params[:location]).id
        hosting = params[:interested_in_hosting]
        if hosting == "hosting"
            hosting = "yes"
        else
            hosting = "no"
        end
        @user.interested_in_hosting = hosting
        hanging = params[:interested_in_hanging_out]
        if hanging == "hanging_out"
            hanging = "yes"
        else
            hanging = "no"
        end
        @user.interested_in_hanging_out = hanging
        if @user.save
            redirect_to user_url, notice: "Successfully edited profile information."
        else
            render "edit"
        end
    end
    
    #Delete user from database
    def destroy
        @user.delete
        redirect_to users_url
    end
    
end

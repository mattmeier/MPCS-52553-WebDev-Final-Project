class UsersController < ApplicationController
    
    before_action :find_user, :only => [:show, :edit, :update, :destroy]
    
    def find_user
        @user = User.find_by(id: params["id"])
    end
    
    #Retrieve and display main info of all users
    def index
        if params["keyword"].present?
            @users = User.where("name LIKE ?", "%#{params["keyword"]}")
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @users = User.limit(100).offset((params["page"].to_i - 1) * 100)
            @users = @users.order('name asc')
            @user_count = @users.count
        else
            @page = 2
            @users = User.limit(100)
            @users = @users.order('name asc')
            @user_count = @users.count
        end
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
    end
    
    #Create a new user and insert the new user into table, based on input parameters
    def create
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        
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
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
    end
    
    def new
        cookies.delete("user_id")
        @user = User.new
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
        render "new"
    end
    
    #Update the database
    def update
        @universities = University.limit(2000) # we do not expect to exceed universities to be more than 2000
        @locations = Location.limit(2000) # we do not expect to exceed locations to be more than 2000
    
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

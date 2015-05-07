class UsersController < ApplicationController

  #Retrieve and display info of all users, universities and locations
  def index
  	@users = User.order('name asc')
  	@universities = University.all
  	@locations = Location.all
  end

  #Create a new users and insert the new user into table, rbased on input parameters. Note that not all aspects of our database model have been inplemented yet (e.g. the friends list)!
  def create
  	user = User.new
    user.name = params[:name]
  	user.email = params[:email]
  	user.password = params[:password]

    #Search database to find the corresponding university id for name entered by user
  	user.university_id = University.find_by(:name => params[:university]).id
  	user.graduation_year = params[:graduation_year]
  	user.major = params[:major]
  	user.bio = params[:bio]

    #Search database to find the corresponding location id for name entered by user
  	user.location_id = Location.find_by(:city => params[:location]).id
  	user.interested_in_hosting = params[:interested_in_hosting]
  	user.interested_in_hanging_out = params[:interested_in_hanging_out]
  	user.save

    #Redirect to homepage after all details have been entered and user clicks submission button
  	redirect_to users_url
  end

  #Show user details
  def show
    @user = User.find_by(id: params[:id])
    if @user == nil
        redirect_to users_url, notice: "User not found."
    end
  end

  #Edit the user's details
  def edit
  	@user = User.find_by(id: params[:id])
  	@universities = University.all
  	@locations = Location.all
  end

  def new
    @universities = University.all
    @locations = Location.all
  end

  #Update the database. Note that not all aspects of our database model have been inplemented yet (e.g. the friends list)!
  def update
  	user = User.find_by(id: params[:id])
    user.name = params[:name]
  	user.email = params[:email]
  	user.password = params[:password]
  	user.university_id = University.find_by(:name => params[:university]).id
  	user.graduation_year = params[:graduation_year]
  	user.major = params[:major]
  	user.bio = params[:bio]
  	user.location_id = Location.find_by(:city => params[:location]).id
  	user.interested_in_hosting = params[:interested_in_hosting]
  	user.interested_in_hanging_out = params[:interested_in_hanging_out]
  	user.save
  	redirect_to users_url
  end

  #Find the user by id and delete him/her from database
  def destroy
  	user = User.find_by(id: params[:id])
  	user.delete
  	redirect_to users_url
  end

end

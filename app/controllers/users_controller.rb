class UsersController < ApplicationController

  

  # skip_before_action :authorize
    
# Lists all users, assigns to instance variable @users
  def index
    @users = User.all
  end

#Shows a user based on ID
  def show
      @user = User.find(params[:id])  
  end

# renders new blank user form, assigns to instance variable @user
  def new
    @user = User.new
  end

#actually creates new user, requires a user and allows the user fields
#in order to have a user, I have to have a user, and it can have these fields
  def create
    
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))

    if @user.save  
      session[:user_id] = @user.id.to_s
          redirect_to @user, notice: 'User was successfully created.'
    else
      redirect_to new_user_path, notice: "Invalid, Check form and try again"
    end
  end

#renders edit page with correct user and form
  def edit
    @user = User.find(params[:id])
  end

#updates said user with username, email
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:username, :email))
      redirect_to users_path
    else
      render 'edit'
    end
  end

#finds user based on id, and deletes them
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  

  

  # def delete_post
  #   @user = User.find(params[:id])
  #   @post = @user.post
  #   @post.destroy
  #   redirect_to user_path
  # end

end
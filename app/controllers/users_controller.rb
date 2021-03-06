class UsersController < ApplicationController
  
	def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated your profile."
      redirect_to @user
    else
      render :edit
    end
  end

  def create
  @user = User.new(user_params)
  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to Hardtop Hounds"
  	else
  		render 'new'
  	end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :profile_id)
  end

  def current_user=(user)
    @current_user = user
  end
end
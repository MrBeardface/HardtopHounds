class UsersController < Devise::RegistrationsController

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
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def remove_avatar
    @user = User.find(params[:id])
    @avatar = @user.find(params[:avatar])
    @avatar.destroy
  end

private

   def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :avatar)
  end

  def current_user=(user)
    @current_user = user
  end
end
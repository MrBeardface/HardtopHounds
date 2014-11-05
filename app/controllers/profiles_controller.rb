class ProfilesController < ApplicationController

	def show
		@profile = Profile.find(params[:id])
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:notice] = "Successfully updated your profile."
      redirect_to current_user.profile
    else
      render :edit
    end
  end

  def remove_avatar
  	@profile = Profile.find(params[:id])
  	@remove_avatar = @profile.update_column(:avatar, nil)
  	render nothing: true, status: 200
  end

private

  def profile_params
   	params.require(:profile).permit(:name, :location, :website, :profile, :avatar, :avatar_cache)
  end

  def current_user=(user)
    @current_user = user
  end
end
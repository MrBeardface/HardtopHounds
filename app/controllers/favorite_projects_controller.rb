class FavoriteProjectsController < ApplicationController
	 def create
  	project_id = params[:project_id]
		current_user.favorite_projects.create(project_id: project_id)
    redirect_to project_path(project_id)
  end

 	def destroy
 		#I want to unbookmark a current bookmarked item.
    @favorite = FavoriteProject.find(params[:id])
   	@favorite.destroy
    redirect_to project_path(@favorite.project)
  end
end

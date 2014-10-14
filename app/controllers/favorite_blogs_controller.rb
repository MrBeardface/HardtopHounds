class FavoriteBlogsController < ApplicationController
def create
  	blog_id = params[:blog_id]
		current_user.favorite_blogs.create(blog_id: blog_id)
    redirect_to blog_path(blog_id)
  end

 	def destroy
 		#I want to unbookmark a current bookmarked item.
    @favorite = FavoriteBlog.find(params[:id])
   	@favorite.destroy
    redirect_to blog_path(@favorite.blog)
  end
end

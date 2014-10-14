class FavoriteTopicsController < ApplicationController
def create
  	topic_id = params[:topic_id]
		current_user.favorite_topics.create(topic_id: topic_id)
    redirect_to topic_path(topic_id)
  end

 	def destroy
 		#I want to unbookmark a current bookmarked item.
    @favorite = FavoriteTopic.find(params[:id])
   	@favorite.destroy
    redirect_to topic_path(@favorite.topic)
  end
end

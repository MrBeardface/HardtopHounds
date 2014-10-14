class ForumsController < ApplicationController
# 	before_filter :authenticate_user!, except: [:show, :index]
#   before_filter :set_forum, except: [:index, :new, :create]
impressionist
	
	def index
		@forums = Forum.all.order("name")
	end

# 	def show
#   end

# 	def new
# 		@forum = Forum.new 
# 		@forum.topics.build
# 	end

# 	def create
# 		@forums = Forum.all
# 		@forum = Forum.new(forum_params)
# 	  if @forum.save
# 	  	# @forum = Forum.find(@topic.forum_id)
# 	    flash[:success] = "Forum Topic Created!"
# 	    redirect_to @forum
# 	  else
# 	    render :new
# 	  end
# 	end

# private
  
#   def forum_params
#     params.require(:forum).permit(:name)
#   end

#   def set_forum
#     @forum = Forum.find(params[:id])
#   end
end
class TopicsController < ApplicationController
	before_filter :authenticate_user!, except: [:show, :index]
  before_filter :set_topic, except: [:index, :new, :create]
  impressionist

	def index
		@topics = Topic.all
	end

	def show
		 @fav_topic = @topic.favorited_by(current_user)
	end

	def new
		@topic = Topic.new
		forums = @topic.forum
	end

	def create
		@topic = current_user.topics.create(topic_params)
	  if @topic.save
	    flash[:success] = "Forum Topic Created!"
	    redirect_to @topic
	  else
	    render :new
	  end
	end

private
  def topic_params
    params.require(:topic).permit(:title, :description, :forum_id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
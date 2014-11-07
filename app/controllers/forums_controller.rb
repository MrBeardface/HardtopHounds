class ForumsController < ApplicationController
# 	before_filter :authenticate_user!, except: [:show, :index]
#   before_filter :set_forum, except: [:index, :new, :create]
impressionist
	
	def index
		@forums = Forum.all.order("name")
	end
end
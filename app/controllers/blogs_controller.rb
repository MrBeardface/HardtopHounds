class BlogsController < ApplicationController
	before_filter :authenticate_user!, except: [:show, :index]
  before_filter :set_blog, except: [:index, :new, :create]
  impressionist

	def index
    @blogs = Blog.find(:all)
  end

  def show
    @fav_blog = @blog.favorited_by(current_user)
  end

  def new
    @blog = Blog.new
  end

	def create
	 @blog = current_user.blogs.build(blog_params)
	  if @blog.save
	    flash[:success] = "Blog Post Created!"
	    redirect_to @blog
	  else
	    render :new
	  end
	end

  def edit
  end

  def update
    if @blog.update_attributes(blog_params)
      flash[:notice] = "Successfully updated your blog."
      redirect_to @blog
    else
      render :edit
    end
  end

private
  def blog_params
    params.require(:blog).permit(:title, :description)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end

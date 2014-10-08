class ProjectsController < ApplicationController
	before_filter :authenticate_user!, except: [:show, :index]
  before_filter :set_project, except: [:index, :new, :create]

  def index
    @projects = Project.find(:all)
  end

  def show
  end

  def new
    @project = Project.new
  end

	def create
	 @project = current_user.projects.build(project_params)
	  if @project.save
	    flash[:success] = "Project Created!"
	    redirect_to @project
	  else
	    render :new
	  end
	end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      flash[:notice] = "Successfully updated your project."
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy  
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
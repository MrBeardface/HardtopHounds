class ProjectsController < ApplicationController
	before_filter :authenticate_user!, except: [:show, :index]
  before_filter :set_project, except: [:index, :new, :create, :add_journal, :remove_journal]
  impressionist
  
  def index
    @projects = Project.find(:all)
  end

  def show
    @fav_project = @project.favorited_by(current_user)
  end

  def new
    @project = Project.new
    @project.photos.build
    @has_projects = Journal.where('projects_count >= ?', 1)
  end

	def create
	 @project = current_user.projects.create(project_params)
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

  def add_journal
    user_id = current_user
    name = params[:name]
    @journal = current_user.journals.create(name: name, user_id: current_user)
  end

  def remove_journal
    @remove_journal = Journal.find(params[:id])
    @remove_journal.destroy
    render nothing: true, status: 200
  end


private

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :description, :journal_id, photos_attributes: [:project_id])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
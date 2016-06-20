class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to @project,  notice: 'post created!'
    else
      render 'new', notice: 'unable to save!'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to @project,  notice: 'project updated!'
    else
      render 'edit', notice: 'unable to save!'
    end
  end
  def destroy
    @project.destroy
    redirect_to projects_path,  notice: 'project deleted!'

  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :link, :slug)
  end
  def find_project
    @project = Project.friendly.find(params[:id])
  end
end

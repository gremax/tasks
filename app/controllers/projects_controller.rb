class ProjectsController < ApplicationController
  before_action :authenticate_user

  def index
    @projects = current_user.projects
    @task = Task.new
  end

  def show
    @project = Project.find_by_id(params[:id])
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(project_params)
    @task = Task.new
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def update
    @project = Project.find_by_id(params[:id])
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to projects_path }
        format.json { respond_with_bip(@project) }
      else
        format.html { redirect_to projects_path }
        format.json { respond_with_bip(@project) }
      end
    end
  end

  def destroy
    @project = Project.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
class ProjectsController < ApplicationController
  before_action :authenticate_user

  def index
    @projects = Project.all
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
    @project = Project.create(project_params)
    @task = Task.new
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
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
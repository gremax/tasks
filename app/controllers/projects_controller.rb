class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @task = Task.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
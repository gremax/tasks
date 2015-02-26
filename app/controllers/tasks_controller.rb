class TasksController < ApplicationController
  def new
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]
    if @task.save
      redirect_to projects_path
    else
      flash[:warning] = "The form can't be blank."
      redirect_to projects_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
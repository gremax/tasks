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

  def update
    @task = Task.find_by_id(params[:id])
    @task.update_attributes(task_params)
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def destroy
    @task = Task.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :done)
  end
end
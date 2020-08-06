class TasksController < ApplicationController
  before_action :set_task, only: [:edit]
  
  def index
    @tasks = Task.includes(:user)
    @task = Task.new
    @counts = Task.group(:priority).count(:priority)
  end

  def new
  end

  def create
    @task = Task.create(task_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:content, :priority, :deadline).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
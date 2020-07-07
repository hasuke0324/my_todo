class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show]
  
  def index
    @task = Task.new
    @tasks = Task.all
    @counts = Task.group(:priority).count(:priority)
  end

  def new
  end

  def create
    @task = Task.create(task_params)
    respond_to do |format|
      format.html { redirect_to :root }
      format.json
    end
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
    params.require(:task).permit(:content, :priority, :deadline)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
  end

  def create
    task_name = params[:task][:title]
    task_details = params[:task][:details]
    task = Task.new(title: task_name, details: task_details)
    task.save!
    @tasks = Task.all
    render 'index'
  end

  def edit
    @id = params[:id]
    set_task
  end

  def update
    task_name = params[:task][:title]
    task_details = params[:task][:details]
    status = params[:task][:completed]
    set_task
    @task.update(title: task_name, details: task_details, completed: status)
    @tasks = Task.all
    render 'show'
  end

  def destroy
    set_task
    @task.destroy
    @tasks = Task.all
    render 'index'
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    # Display details of a single task
  end

  def new
    @task = Task.new
    # Render form for creating a new task
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    end
    # Save the new task and redirect to the tasks index
  end

  def edit
    # Render form for editing a task
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to task_path(@task)
    end
    # Update the task and redirect to the task details page
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
    # Delete a task and redirect to the tasks index
  end

  def set_task
    @task = Task.find(params[:id])
    # Fetch the task based on the provided ID
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
    # Define parameters allowed for task creation and updates
  end
end

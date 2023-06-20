class Api::V1::TasksController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: %i[index show create update destroy]
  before_action :set_task, only: %i[show update destroy]

  def index
    @tasks = @user.tasks
    render json: @tasks, status: :ok
  end

  def show
    if @task
      render json: @task, status: :ok
    else
      render json: { error: 'Task not found' }, status: :not_found
    end
  end

  def create
    @task = @user.tasks.build(task_params)

    if @task.save
      render json: { task: @task }, status: :created
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @task&.update(task_params)
      render json: { message: 'Task updated successfully' }, status: :ok
    else
      render json: { error: 'Unable to update task' }, status: :bad_request
    end
  end

  def destroy
    if @task&.destroy
      render json: { message: 'Task deleted successfully' }, status: :ok
    else
      render json: { error: 'Unable to delete task' }, status: :bad_request
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
    return unless @user.nil?

    render json: { error: 'User not found' }, status: :not_found
  end

  def set_task
    @task = @user.tasks.find_by(id: params[:id])
    return unless @task.nil?

    render json: { error: 'Task not found' }, status: :not_found
  end
end

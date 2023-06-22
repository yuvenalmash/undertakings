class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update destroy]
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    if @user
      render json: @user, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def update
    if @user&.update(user_params)
      render json: { message: 'User updated successfully' }, status: :ok
    else
      render json: { error: 'Unable to update user' }, status: :bad_request
    end
  end

  def destroy
    if @user&.destroy
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { error: 'Unable to delete user' }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end

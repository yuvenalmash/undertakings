class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: { resource: resource }, status: :created
    else
      render json: { errors: resource.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    resource.destroy
    render json: { message: 'User deleted successfully' }, status: :ok
  end

  private

  def sign_up_params
    params.require(:registration).permit(:name, :email, :password, :password_confirmation)
  end
end

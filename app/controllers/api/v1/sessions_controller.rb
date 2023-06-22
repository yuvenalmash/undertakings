class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by(email: params[:session][:email])

    if user&.valid_password?(params[:session][:password])
      token = user.generate_jwt
      render json: { token: token, user: user }, status: :ok
    else
      render json: { errors: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

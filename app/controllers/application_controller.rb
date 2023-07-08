class ApplicationController < ActionController::API
  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    return render json: { error: 'Token not found' }, status: :unauthorized unless token

    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
    puts 'decoded_token: ', decoded_token
    payload = decoded_token.first
    puts 'payload: ', payload
    @current_user = User.find_by(id: payload['id'])
    puts '@current_user: ', @current_user
    render json: { error: 'Invalid token' }, status: :unauthorized unless @current_user
  rescue JWT::ExpiredSignature => e
    render json: { error: "Token expired: #{e.message}" }, status: :unauthorized
  rescue JWT::DecodeError => e
    render json: { error: "Decode error: #{e.message}" }, status: :unauthorized
  end

  attr_reader :current_user
end

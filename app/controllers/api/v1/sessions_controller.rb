class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    session[:user_id] = user.id
    csrf_token = form_authenticity_token
    if user.authenticate(session_params[:password])
      render json: SessionSerializer.new(user), status: :ok
    else
      render json: {error: "The information does not match any records"}, status: :not_found
    end
  end

  private

  def session_params
    params.require(:session).
      permit(:email, :password)
  end
end

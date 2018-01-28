class V1::SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    token = AuthenticateUser.call(email: params[:email], password: params[:password], username: params[:username])
    if token
      render json: { auth_token: token }
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {}, status: :ok
  end
end

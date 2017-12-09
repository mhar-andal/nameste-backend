class V1::SessionsController < ApplicationController

  def create
    user = User.where(email: params[:email]).or(User.where(username: params[:username])).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {}, status: :ok
  end
end

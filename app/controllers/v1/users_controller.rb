class V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, :only => [:create]
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { user_token: JsonWebToken.encode(user_id: user.id) } 
    else
      render json: { errors: user.errors.full_messages }, status: :unauthorized
    end
  end

  def show
    render json: current_user
  end
end

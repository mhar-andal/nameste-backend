class V1::UsersController < ApplicationController

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
      session[:user_id] = user.id
      render json: user.to_json(except: [:password_digest])
    else
      render json: {errors: user.errors}, status: :unauthorized
    end
  end
end

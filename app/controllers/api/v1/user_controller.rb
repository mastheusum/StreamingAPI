class Api::V1::UserController < ApplicationController

  def create
    if user_params.key?(:email) and user_params.key?(:password)
      @user = User.create(user_params)
      if @user.save
        render json: { message: "SUCEFULL", data: { user: { email: @user.email, access_token: @user.access_token } } }, status: 201
      else
        render json: { message: "INVALID PARAMETERS" }, status: 409
      end
    else
      render json: { message: "NOT FOUND" }, status: 404
    end
  end

  def update
    @user = User.find_by email: user_params[:email]
    if @user 
      if @user.access_token == user_params[:access_token]
        @user.update(user_params)
        render json: { message: "SUCEFULL", data: { user: { email: @user.email, access_token: @user.access_token } } }, status: 202
      else
        render json: { message: "UNAUTHORIZED" }, status: 401 
      end
    else
      render json: { message: "NOT FOUND" }, status: 404 
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :access_token)
    end

    def set_user
      @user = User.create(user_params)
    end
end

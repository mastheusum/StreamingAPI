class Api::V1::UserController < ApplicationController

  def create
    if user_params[:data].key?(:email) and user_params[:data].key?(:password)
      @user = User.create(user_params[:data])
      if @user.save
        render json: { message: "SUCEFULL", data: { user: { email: @user.email, access_token: @user.access_token } } }, status: 201
      else
        render json: { message: "INVALID PARAMETERS" }, status: 401
      end
    else
      render json: { message: "NOT FOUND" }, status: 404
    end
  end

  def update
    @user = User.find_by email: user_params[:data][:email]
    if @user 
      if @user.access_token == user_params[:data][:access_token]
        @user.update(user_params[:data])
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
      params.require(:data).permit(user: [:email, :password, :access_token])
    end

    def set_user
      @user = User.create(user_params)
    end
end

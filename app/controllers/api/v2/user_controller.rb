class Api::V2::UserController < ApplicationController

  def create
    @user = User.new user_params[:user]
    if @user.save!
      render json: { data: { email: @user.email }, message: 'Já é possível realizar login' }, status: 201
    else
      render json: { data: { message: 'Dados inválidos' } }, status: 400
    end
  end

  def destroy
    @user = User.find_by email: user_params[:user][:email]
    @session = Api::V2::Session.find_by user: @user
    @session.destroy
    @user.destroy
    render json: {  }, status: 204
  end

  private
    def user_params
      params.require(:data).permit(user:[:email, :password])
    end
end

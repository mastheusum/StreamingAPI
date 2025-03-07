class Api::V1::SessionController < ApplicationController
  def create
    @user = User.find_by email: session_params[:email]
    puts @user
    if @user and @user.authenticate(session_params[:password])
      render json: { message: 'Login realizado com sucesso', data: { user: { email: @user.email, access_token: @user.access_token } } }, status: 200
    else
      render json: { message: "NOT FOUND" }, status: 404
    end
  end

  def destroy
    puts session_params
    if session_params.key?(:email)
      @user = User.find_by email: session_params[:email]
      if @user
        if @user.access_token == session_params[:access_token]
          @user.destroy_session
          render json: { message: 'Session closed' }, status: 200
        else
          render json: { message: 'Forbiden' }, status: 401
        end
      else
        render json: { message: 'User not found' }, status: 404
      end
    else
      render json: { message: 'Forbiden' }, status: 404
    end
  end

  private
    def session_params
      params.require(:user).permit(:email, :password, :access_token)
    end
end

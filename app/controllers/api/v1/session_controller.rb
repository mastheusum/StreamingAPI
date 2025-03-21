class Api::V1::SessionController < ApplicationController
  def create
    @user = User.find_by email: session_params[:user][:email]
    puts @user
    if @user and @user.authenticate(session_params[:user][:password])
      render json: { message: 'Login realizado com sucesso', data: { user: { email: @user.email, access_token: @user.access_token } } }, status: 200
    else
      render json: { message: "NOT FOUND" }, status: 404
    end
  end

  def destroy
    # puts ">>> #{session_params}"
    @user = User.find_by email: session_params[:user][:email]
    if @user
      if @user.access_token == session_params[:user][:access_token]
        @user.destroy_session
        render json: { message: 'Sessão encerrada' }, status: 200
      else
        render json: { message: 'Acesso proibido' }, status: 401
      end
    else
      render json: { message: 'Usuário não encontrado' }, status: 404
    end
  end

  private
    def session_params
      params.require(:data).permit(user: [:email, :password, :access_token])
    end
end

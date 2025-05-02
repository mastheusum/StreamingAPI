class Api::V2::SessionsController < ApplicationController

  # POST /api/v2/sessions
  def create
    @user = User.find_by email: session_params[:user][:email]
    
    if @user
      @session = Api::V2::Session.find_by user: @user
      if not @session
        @session = Api::V2::Session.new user: @user
        @session.generate_access_token
        @session.save
        render json: { data: { email: @user.email, access_token: @session.access_token }, message: 'login realizado com sucesso' }, status: 201
      else
        render json: { data: { email: @user.email }, message: 'Usuário já conectado' }, status: 401
      end
    else
      render json: { data: { }, message: 'Usuário não existe' }, status: 401
    end
  end


  # DELETE /api/v2/sessions/1
  def destroy
    @api_v2_session.destroy!
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:data).permit(user: [:email, :password], session: [:access_token])
    end
end

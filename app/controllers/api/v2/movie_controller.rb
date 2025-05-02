class Api::V2::MovieController < ApplicationController

  def index
    @user = User.find_by email: movie_params[:session][:email]
    @session = Api::V2::Session.find_by user: @user
    if @session
      if @session.access_token == movie_params[:session][:access_token]
        @q = Movie.ransack movie_params[:q]
        @movies = @q.result
        render json: { message: "SUCCESS", data: { user: { email: @user.email, access_token: @user.access_token}, movies: @movies } }, status: 200
      else
        render json: { message: "Dados inválidos" }, status: 401
      end
    else
      render json: { data: { message: "Dados inválidos" } }, status: 404
    end    
  end

  private
    def movie_params
      params.require(:data).permit( :q,
        session: [:email, :access_token],
        movie: [:title, :genre, :release_date]
      )
    end

end

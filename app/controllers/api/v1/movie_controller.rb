class Api::V1::MovieController < ApplicationController

  def index
    if movie_params.key?(:user) and movie_params[:user].key?(:email) and movie_params[:user].key?(:access_token)
      @user = User.find_by email: movie_params[:user][:email]
      if @user
        if @user.access_token == movie_params[:user][:access_token]
          @q = Movie.ransack movie_params[:q]
          @movies = @q.result
          render json: { message: "SUCCESS", data: { user: { email: @user.email, access_token: @user.access_token}, movies: @movies } }, status: 200
        else
          render json: { message: "Dados inválidos" }, status: 401
        end
      else
        render json: { data: { message: "Dados inválidos" } }, status: 404  
      end      
    else
      render json: { data: { message: "Dados inválidos" } }, status: 404
    end
  end

  def index
    if movie_params.key?(:user) and movie_params[:user].key?(:email) and movie_params[:user].key?(:access_token)
      @user = User.find_by email: movie_params[:user][:email]
      if @user
        if @user.access_token == movie_params[:user][:access_token]
          @movie = Movie.find(params[:id])
          render json: { message: "SUCCESS", data: { user: { email: @user.email, access_token: @user.access_token}, movie: @movie } }, status: 200
        else
          render json: { message: "Dados inválidos" }, status: 401
        end
      else
        render json: { data: { message: "Dados inválidos" } }, status: 404  
      end      
    else
      render json: { data: { message: "Dados inválidos" } }, status: 404
    end
  end

  private
    def movie_params
      params.require(:data).permit( q: [ :genre_eq, :title_cont ],
        user: [:email, :access_token],
        movie: [:title, :genre, :release_date],
        :id
      )
    end

end

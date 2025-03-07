class AddMovieUrlToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :movie_url, :string
  end
end

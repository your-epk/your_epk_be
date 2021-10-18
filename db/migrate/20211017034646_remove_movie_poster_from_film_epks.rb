class RemoveMoviePosterFromFilmEpks < ActiveRecord::Migration[5.2]
  def change
    remove_column :film_epks, :movie_poster, :string
  end
end

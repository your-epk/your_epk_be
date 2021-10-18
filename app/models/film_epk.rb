class FilmEpk < ApplicationRecord
  belongs_to :user
  has_one_attached :movie_poster

  def movie_poster_url
    if movie_poster.attached?
      movie_poster.blob.service_url
    end
  end
end

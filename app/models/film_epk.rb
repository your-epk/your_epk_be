class FilmEpk < ApplicationRecord
  belongs_to :user
  has_many :awards, dependent: :destroy
  has_many :film_fams, dependent: :destroy
  has_many :presses, dependent: :destroy
  has_one_attached :movie_poster
  has_one_attached :header_image

  def movie_poster_url
    if movie_poster.attached?
      movie_poster.blob.service_url
    end
  end
end

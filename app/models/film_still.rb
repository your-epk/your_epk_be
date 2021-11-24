class FilmStill < ApplicationRecord
  belongs_to :film_epk
  has_one_attached :still_image

  def film_still_url
    if still_image.attached?
      still_image.blob.service_url
    end
  end
end 
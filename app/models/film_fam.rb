class FilmFam < ApplicationRecord
  belongs_to :film_epk
  has_one_attached :head_shot

  def head_shot_url
    if head_shot.attached?
      head_shot.blob.service_url
    end
  end
end

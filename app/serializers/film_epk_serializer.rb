class FilmEpkSerializer
  include FastJsonapi::ObjectSerializer
  has_many :awards
  has_many :presses
  has_many :film_fams
  has_many :film_stills

  set_type :film_epk
  attributes :user_id,
             :movie_title,
             :genre,
             :trailer,
             :teaser,
             :tag_line,
             :log_line,
             :synopsis,
             :country,
             :release_year,
             :run_time,
             :language,
             :budget,
             :website,
             :production_company,
             :distribution,
             :contact_name,
             :contact_email,
             :contact_number,
             :company_name,
             :header_image_description

  attribute :movie_poster_url do |object|
    object.movie_poster_url
  end

  attribute :header_image_url do |object|
    object.header_image_url
  end
end

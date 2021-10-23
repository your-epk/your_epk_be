class FilmEpkSerializer
  include FastJsonapi::ObjectSerializer
  has_many :awards
  # has_many :presses
  # has_many :film_fams
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
             :company_name
end

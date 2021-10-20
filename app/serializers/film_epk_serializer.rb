class FilmEpkSerializer
  include FastJsonapi::ObjectSerializer
  set_type :film_epk
  attributes :user_id,
             :movie_title,
             :genre,
             :country,
             :release_year,
             :run_time,
             :language,
             :budget,
             :website,
             :production_company,
             :distribution,
             :awards,
             :film_fams,
             :presses
end

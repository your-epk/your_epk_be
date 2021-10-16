class MovieDetailsSerializer
  include FastJsonapi::ObjectSerializer
  set_type :film_epk
  attributes :user_id, 
             :genre, 
             :country, 
             :release_year, 
             :run_time, 
             :language, 
             :budget, 
             :website, 
             :production_company, 
             :distribution
end
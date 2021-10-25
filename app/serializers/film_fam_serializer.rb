class FilmFamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :role,
             :first_name,
             :last_name,
             :description,
             :film_epk_id
end
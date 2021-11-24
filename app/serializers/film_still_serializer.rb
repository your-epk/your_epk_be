class FilmStillSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description,
             :film_epk_id
  
  attribute :film_still_url do |object|
    object.film_still_url
  end    
end

class FilmFamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :role,
             :first_name,
             :last_name,
             :description,
             :film_epk_id

  attribute :head_shot_url do |object|
    object.head_shot_url
  end
end
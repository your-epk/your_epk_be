class PressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name_of_publication,
             :description,
             :link,
             :film_epk_id
end

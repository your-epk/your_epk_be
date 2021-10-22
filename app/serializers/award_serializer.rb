class AwardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,
             :year,
             :award_type,
             :film_epk_id
end

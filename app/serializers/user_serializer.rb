class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_many :film_epks
  attributes :email,
             :first_name,
             :last_name

  # attribute :film_epks do |object|
  #   UserFilmEpkSerializer.new(object.film_epks)
  # end
end

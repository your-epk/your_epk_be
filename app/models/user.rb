class User < ApplicationRecord
  has_many :film_epks
  has_secure_password
end

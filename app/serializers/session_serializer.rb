class SessionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user

  attributes :email,
             :first_name,
             :last_name
end

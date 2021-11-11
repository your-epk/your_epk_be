class SessionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user

  attributes :email,
             :first_name,
             :last_name

  attribute :csrf_token do |object, params|
    params[:token]
  end
end

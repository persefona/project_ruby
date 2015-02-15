json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :login, :crypted_password, :password_salt, :email, :persistence_token, :role
  json.url user_url(user, format: :json)
end

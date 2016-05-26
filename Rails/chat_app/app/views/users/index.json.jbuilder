json.array!(@users) do |user|
  json.extract! user, :id, :email, :link, :about, :birthday, :first_name, :last_name, :website
  json.url user_url(user, format: :json)
end

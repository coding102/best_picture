json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :total_likes
  json.url user_url(user, format: :json)
end

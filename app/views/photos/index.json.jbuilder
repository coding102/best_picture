json.array!(@photos) do |photo|
  json.extract! photo, :id, :user_id, :image, :body, :vote
  json.url photo_url(photo, format: :json)
end

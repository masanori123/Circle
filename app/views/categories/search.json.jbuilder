json.array! @users do |user|
  json.id        user.id
  json.name     user.name
  json.image     user.image_url
  json.team_name user.team_name
end

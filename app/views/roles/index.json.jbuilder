json.array!(@roles) do |role|
  json.extract! role, :id, :name, :club_id, :period_id
  json.url role_url(role, format: :json)
end

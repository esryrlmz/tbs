json.array!(@club_periods) do |club_period|
  json.extract! club_period, :id, :club_id, :name, :is_active
  json.url club_period_url(club_period, format: :json)
end

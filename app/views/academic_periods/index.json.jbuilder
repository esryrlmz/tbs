json.array!(@academic_periods) do |academic_period|
  json.extract! academic_period, :id, :name, :is_active
  json.url academic_period_url(academic_period, format: :json)
end

json.array!(@club_settings) do |club_setting|
  json.extract! club_setting, :id, :period_id, :max_user, :program_id
  json.url club_setting_url(club_setting, format: :json)
end

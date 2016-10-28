json.array!(@club_categories) do |club_category|
  json.extract! club_category, :id, :name
  json.url club_category_url(club_category, format: :json)
end

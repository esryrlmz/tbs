json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :short_name, :description, :creation_date
  json.url club_url(club, format: :json)
end

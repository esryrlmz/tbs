json.array!(@club_slides) do |club_slide|
  json.extract! club_slide, :id, :file, :title
  json.url club_slide_url(club_slide, format: :json)
end

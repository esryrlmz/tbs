json.array!(@club_contacts) do |club_contact|
  json.extract! club_contact, :id, :period_id, :address, :email, :phone_number, :face_url, :tw_url, :gplus_url, :youtube_url, :github_url, :linkedin_url
  json.url club_contact_url(club_contact, format: :json)
end

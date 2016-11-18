json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :period_id, :title, :content, :is_view, :is_advisor_confirmation
  json.url announcement_url(announcement, format: :json)
end

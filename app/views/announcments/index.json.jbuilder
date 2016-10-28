json.array!(@announcments) do |announcment|
  json.extract! announcment, :id, :period_id, :title, :content, :is_view, :is_advisor_confirmation
  json.url announcment_url(announcment, format: :json)
end

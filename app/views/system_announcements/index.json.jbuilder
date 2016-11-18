json.array!(@system_announcements) do |system_announcement|
  json.extract! system_announcement, :id, :title, :content, :is_view
  json.url system_announcment_url(system_announcement, format: :json)
end

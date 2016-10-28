json.array!(@system_announcments) do |system_announcment|
  json.extract! system_announcment, :id, :title, :content, :is_view
  json.url system_announcment_url(system_announcment, format: :json)
end

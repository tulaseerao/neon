json.array!(@timelines) do |timeline|
  json.extract! timeline, :id, :device, :date_of_service, :qty
  json.url timeline_url(timeline, format: :json)
end

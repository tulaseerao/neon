json.array!(@devices) do |device|
  json.extract! device, :id, :device, :date_of_service, :qty
  json.url computer_timeline_url(device, format: :json)
end

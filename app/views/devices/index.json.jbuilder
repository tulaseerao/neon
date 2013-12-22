json.array!(@devices) do |device|
  json.extract! device, :id, :name, :brand
  json.url device_url(device, format: :json)
end

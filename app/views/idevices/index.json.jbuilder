json.array!(@idevices) do |device|
  json.extract! idevice, :id, :name, :device_type, :serial_number, :asset_tag
  json.url idevice_url(device, format: :json)
end

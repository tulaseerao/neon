json.array!(@idevices) do |idevice|
  json.extract! idevice, :id, :device_type, :model_number, :capacity_hd, :serial_number, :asset_tag, :name
  json.url idevice_url(idevice, format: :json)
end

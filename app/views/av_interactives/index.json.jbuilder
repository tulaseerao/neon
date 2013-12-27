json.array!(@devices) do |device|
  json.extract! device, :id, :brand, :device_type, :asset_tag, :serial_no
  json.url av_interactive_url(device, format: :json)
end

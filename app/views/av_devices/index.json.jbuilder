json.array!(@av_devices) do |av_device|
  json.extract! av_device, :id, :status, :asset_tag, :device, :location, :brand, :model, :serial_number, :value, :lease, :lease_term, :owner_or_teacher, :notes
  json.url av_device_url(av_device, format: :json)
end

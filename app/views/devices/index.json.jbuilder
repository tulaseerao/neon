json.array!(@devices) do |device|
  json.extract! device, :id, :key, :computer_name, :device_type, :assignment, :location, :change, :date_in_service, :asset_tag, :serial_number, :manufacturer, :disposal_date, :mac1, :mac2, :cpu, :ghz, :core, :hdd, :screen
  json.url device_url(device, format: :json)
end

json.array!(@printers) do |printer|
  json.extract! printer, :id, :name, :location, :asset_tag, :serial_no
  json.url printer_url(printer, format: :json)
end

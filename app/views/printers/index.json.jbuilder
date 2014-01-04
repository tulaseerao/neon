json.array!(@printers) do |printer|
  json.extract! printer, :id, :printer, :location, :host_server, :ip_address, :win_7, :win_xp, :asset_tag, :serial_number, :comment
  json.url printer_url(printer, format: :json)
end

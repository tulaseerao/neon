class Idevice < ActiveRecord::Base
 attr_accessible :name, :device_type, :model_number, :hd_capacity, :serial_number, :asset_tag
   def self.import(file)
    # spreadsheet = Import::Uploader.open_spreadsheet(file)
  #   
    # header = spreadsheet.row(1)
    # logger.info "Before header:::#{header}"
    # header = header.map { |value|
        # value.parameterize.underscore if value
    # }
  #   
    # (2..spreadsheet.last_row).each do |i|
        # row = Hash[[header, spreadsheet.row(i)].transpose].reject!{|k,v| v.nil?}
        # device = find_by_serial_number(row["serial_number"]) || find_by_asset_tag(row["asset_tag"]) || new
        # device.attributes = row.to_hash.slice(*accessible_attributes)
        # device.save!
    # end
     spreadsheet = Import::Uploader.open_spreadsheet(file)
     spreadsheet.default_sheet = "iDevices"
     Processheet.process_spreadsheet(spreadsheet, self)
    
   
      
  end

  def self.process_result(row)
    device = find_by_serial_number(row["serial_number"]) || find_by_asset_tag(row["asset_tag"]) || new
    device.attributes = row.to_hash.slice(*accessible_attributes)
    device.save!
  end
end

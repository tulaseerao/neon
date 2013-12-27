class Idevice < ActiveRecord::Base
  attr_accessible :name, :device_type, :model_number, :hd_capacity, :serial_number, :asset_tag
  
  IDEVICE_ATTR_MAPPING = {
    :name => "Name",
    :device_type => "Device Type",
    :model_number => "Model Number",
    :hd_capacity => "Capacity HD",
    :serial_number => "Serial Number",
    :asset_tag => "Asset Tag"
  }
  
  def self.submit_sheet(spreadsheet)
    header = spreadsheet.row(1)
    new_header = Array.new
    header.each {|key| 
      if !IDEVICE_ATTR_MAPPING.invert[key].to_s.blank? 
        new_header << key.replace(IDEVICE_ATTR_MAPPING.invert[key].to_s)
      else
        new_header << key
      end
    }
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[new_header, spreadsheet.row(i)].transpose]
      logger.info "ROWWWWWWWWWW :: #{row.inspect}"
      idevice = find_by_serial_number_and_asset_tag(row["serial_number"], row["asset_tag"]) || new
      idevice.attributes = row.to_hash.slice(*accessible_attributes)
      logger.info "################### #{idevice.inspect}"
      idevice.save!
     end
  end
end

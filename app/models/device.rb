class Device < ActiveRecord::Base
  attr_accessible :name, :key, :brand, :device_type, :assignment, :location, :change_location, :date_in_service, :asset_tag, :serial_no, :disposal_date, :mac1, :mac2, :cpu, :ghz, :core, :hdd, :screen
  
  DEVICE_ATTR_MAPPING = {
    :name => "Computer Name",
    :key => "Key",
    :brand => "Manufacturer",
    :device_type => "Device Type",
    :assignment => "Assignment",
    :location => "Location",
    :change_location => "Change Location",
    :date_in_service => "Date in Service",
    :asset_tag => "Asset Tag",
    :serial_no => "s/n",
    :disposal_date => "Disposal Date",
    :mac1 => "mac1",
    :mac2 => "mac2",
    :cpu => "cpu",
    :ghz => "Ghz",
    :core => "core",
    :hdd => "hdd",
    :screen => "screen"
  }
  
  def self.submit_sheet(spreadsheet)
    #header = spreadsheet.row(1)
    header = spreadsheet.row(1).map { |value|
      value.parameterize.underscore
    }
    logger.info "########### #{header.inspect}"
    new_header = Array.new
    header.each {|key| 
      if !DEVICE_ATTR_MAPPING.invert[key].to_s.blank? 
        new_header << key.replace(DEVICE_ATTR_MAPPING.invert[key].to_s)
      else
        new_header << key
      end
    }
    logger.info "NEW HEADER:::: #{new_header.inspect}"
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[new_header, spreadsheet.row(i)].transpose]
      device = find_by_name(row["name"]) || new
      device.attributes = row.to_hash.slice(*accessible_attributes)
      device.save!
     end
  end
  
end

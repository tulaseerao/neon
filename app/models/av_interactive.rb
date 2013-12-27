class AvInteractive < ActiveRecord::Base
  attr_accessible :brand, :device_type, :location, :model, :asset_tag, :serial_no, :status, :value, :lease, :lease_term, :owner, :notes
  
  AV_ATTR_MAPPING = {
    :brand => "Brand",
    :device_type => "Device", 
    :location => "Location",
    :model => "Model",
    :asset_tag => "Asset Tag",
    :serial_no => "Serial",
    :status => "Status",
    :value => "Value",
    :lease => "Lease",
    :lease_term => "Lease Term",
    :owner => "Owner / Teacher",
    :notes => "Notes",
  }
  
  def self.submit_sheet(spreadsheet)
    header = spreadsheet.row(1)
    new_header = Array.new
    header.each {|key|
      if !AV_ATTR_MAPPING.invert[key].to_s.blank? 
        new_header << key.replace(AV_ATTR_MAPPING.invert[key].to_s)
      else
        new_header << key
      end
    }
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[new_header, spreadsheet.row(i)].transpose]
      av_inter = find_by_serial_no_and_asset_tag(row["serial_no"], row["asset_tag"]) || new
      av_inter.attributes = row.to_hash.slice(*accessible_attributes)
      logger.info "################### #{av_inter.inspect}"
      av_inter.save!
     end
  end
  
end

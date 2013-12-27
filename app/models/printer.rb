class Printer < ActiveRecord::Base
  attr_accessible :name, :location, :host, :ip_address, :win7, :winxp, :asset_tag, :serial_no, :comment
  
  PRINTER_ATTR_MAPPING = {
    :name => "Printer",
    :location => "Location", 
    :host => "Host/Server",
    :ip_address => "IP Address",
    :win7 => "Win 7",
    :winxp => "Win XP",
    :asset_tag => "Asset Tag",
    :serial_no => "Serial Number",
    :comment => "Comment"
  }
  
  def self.submit_sheet(spreadsheet)
    header = spreadsheet.row(1)
    logger.info "LLLLLLLLLLLLLLLLLLLL #{header.inspect}"
    new_header = Array.new
    header.each {|key| 
      if !PRINTER_ATTR_MAPPING.invert[key].to_s.blank? 
        new_header << key.replace(PRINTER_ATTR_MAPPING.invert[key].to_s)
      else
        new_header << key
      end
    }
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[new_header, spreadsheet.row(i)].transpose]
      printer = find_by_location_and_asset_tag(row["location"], row["asset_tag"]) || new
      printer.attributes = row.to_hash.slice(*accessible_attributes)
      logger.info "################### #{printer.inspect}"
      printer.save!
     end
  end
  
end

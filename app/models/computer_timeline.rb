class ComputerTimeline < ActiveRecord::Base
  attr_accessible :device, :date_of_service, :qty
  
  TIMELINE_ATTR_MAPPING = {
    :device => "Device",
    :date_of_service => "Date of Service", 
    :qty => "Qty",
  }
  
  def self.submit_sheet(spreadsheet)
    header = spreadsheet.row(1)
    new_header = Array.new
    header.each {|key| 
      if !TIMELINE_ATTR_MAPPING.invert[key].to_s.blank? 
        new_header << key.replace(TIMELINE_ATTR_MAPPING.invert[key].to_s)
      else
        new_header << key
      end
    }
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[new_header, spreadsheet.row(i)].transpose]
      timeline = find_by_device(row["device"]) || new
      timeline.attributes = row.to_hash.slice(*accessible_attributes)
      logger.info "################### #{timeline.inspect}"
      timeline.save!
     end
  end
end

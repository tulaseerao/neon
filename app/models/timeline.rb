class Timeline < ActiveRecord::Base
  attr_accessible :device, :date_of_service, :qty
  def self.import(file)
   spreadsheet = Import::Uploader.open_spreadsheet(file)
   spreadsheet.default_sheet = "Computer Timeline"
   Processheet.process_spreadsheet(spreadsheet, self)
  end
  
  def self.process_result(row)
    device = find_by_device(row["device"]) || new
    device.attributes = row.to_hash.slice(*accessible_attributes)
    device.save!
  end
end

class Idevice < ActiveRecord::Base
 attr_accessible :name, :device_type, :model_number, :hd_capacity, :serial_number, :asset_tag
   def self.import(file)
     spreadsheet = Import::Uploader.open_spreadsheet(file)
     spreadsheet.default_sheet = "iDevices"
     Processheet.process_spreadsheet(spreadsheet, self)
   end

  def self.process_result(row)
    device = find_by_serial_number(row["serial_number"]) || find_by_asset_tag(row["asset_tag"]) || new
    device.attributes = row.to_hash.slice(*accessible_attributes)
    device.save!
  end
  
  def self.search(search)
    if search
      where('name LIKE ? or device_type LIKE ? or model_number LIKE ? or serial_number LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end

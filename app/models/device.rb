class Device < ActiveRecord::Base
  attr_accessible :computer_name, :key, :brand, :device_type, :assignment, :location, :manufacturer, :change_location, :date_in_service, :asset_tag, :serial_number, :disposal_date, :mac1, :mac2, :cpu, :ghz, :core, :hdd, :screen
  attr_accessible :ethernet_mac_address, :wireless_mac_address, :os, :printer, :projector, :sb, :age, :notes, :memory
  
  def self.import(file)
     spreadsheet = Import::Uploader.open_spreadsheet(file)
     spreadsheet.default_sheet = "Devices"
     Processheet.process_spreadsheet(spreadsheet, self)
   end
   
   def self.process_result(row)
    device = find_by_computer_name(row["computer_name"]) || new
    device.attributes = row.to_hash.slice(*accessible_attributes)
    device.save!
  end
  
  def self.search(search)
    if search
      where('computer_name LIKE ? or device_type LIKE ? or assignment LIKE ? or location LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end

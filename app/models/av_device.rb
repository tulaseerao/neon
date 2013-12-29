class AvDevice < ActiveRecord::Base
   attr_accessible :brand, :device, :location, :model, :asset_tag, :serial_number, :status, :value, :lease, :lease_term, :owner_or_teacher, :notes
   def self.import(file)
     spreadsheet = Import::Uploader.open_spreadsheet(file)
     spreadsheet.default_sheet = "AV - Interactive"
     Processheet.process_spreadsheet(spreadsheet, self)
   end
  
  def self.process_result(row)  
    if colmn = ['serial_number','asset_tag'].find {|col| row[col] }
    # if row["serial_number"].present? || row["asset_tag"].present? || row["location"].present?
      # device = send("find_by_#{colmn}", row[colmn]) || new
      device = where({"#{colmn}"=> row[colmn]}).first || new
      device.attributes = row.to_hash.slice(*accessible_attributes)
      device.save!
    else
      where(row).first_or_create  
    end
  end
end

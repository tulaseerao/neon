class Printer < ActiveRecord::Base
   attr_accessible :printer, :location, :host_server, :ip_address, :win_7, :win_xp, :asset_tag, :serial_number, :comment

  def self.import(file)
     spreadsheet = Import::Uploader.open_spreadsheet(file)
     spreadsheet.default_sheet = "Printers"
     Processheet.process_spreadsheet(spreadsheet, self)
  end
   
  def self.process_result(row)
    if colmn = ['serial_number','asset_tag','location'].find {|col| row[col] }
      device = where({"#{colmn}"=> row[colmn], printer: row['printer']}).first || new
      device.attributes = row.to_hash.slice(*accessible_attributes)
      device.save!
    else
      where(row).first_or_create  
    end
  end
  
  def self.search(search)
    if search
      where('printer LIKE ? or host_server LIKE ? or location LIKE ? or serial_number LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end

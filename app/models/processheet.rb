class Processheet < ActiveRecord::Base
  
  def self.process_spreadsheet(spreadsheet, device)
    header = spreadsheet.row(1)
    header.map! { |value|
      value.gsub('/','Or').parameterize.underscore if value
    }
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose].reject{|k,v| v.nil?}
      device.process_result(row)
      #device.send(:process_result,row)
    end
  end
  
  def self.process_all(file)
    spreadsheet = Import::Uploader.open_spreadsheet(file)
     spreadsheet.sheets.each do |sheet| 
        spreadsheet.default_sheet = sheet
        header = spreadsheet.row(1) if !sheet.include?('Sheet')
        if !header.blank?
          if device_sheet?(header, sheet)
            process_spreadsheet(spreadsheet, "Device".constantize)
          elsif idevice_sheet?(header, sheet)
            process_spreadsheet(spreadsheet, "Idevice".constantize)
          elsif printer_sheet?(header, sheet)
            process_spreadsheet(spreadsheet, "Printer".constantize)
          elsif avinteractive_sheet(header, sheet)
            process_spreadsheet(spreadsheet, "AvDevice".constantize)
          elsif timeline_sheet?(header, sheet)  
            process_spreadsheet(spreadsheet, "Timeline".constantize)      
         end
          
        end
        
     end
  end
  
  def self.device_sheet?(header, sheet)
    sheet.downcase == 'devices' && (header.include? "Computer Name")
  end
  
  def self.idevice_sheet?(header, sheet)
    sheet.downcase == 'idevices' && (header.include? "Serial Number") && (header.include? "Asset Tag")
  end
  
  def self.printer_sheet?(header, sheet)
   sheet.downcase == 'printers' && (header.include? "Printer")
  end
  
  def self.avinteractive_sheet(header, sheet)
    sheet.downcase == 'av - interactive' && (header.include? "Serial Number") && (header.include? "Brand")
  end
  
  def self.timeline_sheet?(header, sheet)
    sheet.downcase == 'computer timeline' && (header.include? "Device") && (header.include? "Date of Service")
  end
  
end
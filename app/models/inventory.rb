class Inventory < ActiveRecord::Base
  
  def self.import(file)
    spreadsheet = Import::Uploader.open_spreadsheet(file)
    
    spreadsheet.sheets.each do |sheet| 
      spreadsheet.default_sheet = sheet
      header = spreadsheet.row(1)
      if !header.blank?
        logger.info "Spreadsheet :: #{spreadsheet.inspect}"
        logger.info "HEADER:: #{header.inspect}"
        
        
        if is_device_sheet(header, sheet)
          Device.submit_sheet(spreadsheet)
        elsif is_idevice_sheet(header, sheet)
          Idevice.submit_sheet(spreadsheet)
        elsif is_printer_sheet(header, sheet)
          Printer.submit_sheet(spreadsheet)
        elsif is_avinteractive_sheet(header, sheet)
          AvInteractive.submit_sheet(spreadsheet)
        elsif is_timeline_sheet(header, sheet)
          ComputerTimeline.submit_sheet(spreadsheet)
        end
      end
    end
  end
  
  def self.is_device_sheet(header, sheet)
    if sheet.downcase == 'master' && (header.include? "Computer Name")
      return true
    end
    return false
  end
  
  def self.is_idevice_sheet(header, sheet)
    if sheet.downcase == 'idevices' #&& (header.include? "Serial Number") && (header.include? "Asset Tag")
      return true
    end
    return false
  end
  
  def self.is_printer_sheet(header, sheet)
    if sheet.downcase == 'printers' #&& (header.include? "Printer")
      return true
    end
    return false
  end
  
  def self.is_avinteractive_sheet(header, sheet)
    if sheet.downcase == 'av - interactive' #&& (header.include? "Serial") && (header.include? "Brand")
      return true
    end
    return false
  end
  
  def self.is_timeline_sheet(header, sheet)
    if sheet.downcase == 'computer timeline' #&& (header.include? "Device") && (header.include? "Date of Service")
      return true
    end
    return false
  end
end

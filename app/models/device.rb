class Device < ActiveRecord::Base
   attr_accessible :name, :brand, :device_type
  def self.import(file)
    spreadsheet = Import::Uploader.open_spreadsheet(file)
    header = spreadsheet.row(1).map { |value|
      value.downcase.gsub(' ','_')
    }
    logger.info "Header::>>#{header}"
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      logger.info "Row::::#{row}"
      device = find_by_id(row["id"].to_i) || new
      device.attributes = row.to_hash.slice(*accessible_attributes)
      device.save!
     end
  end
end

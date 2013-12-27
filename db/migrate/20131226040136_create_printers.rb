class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :name
      t.string :location
      t.string :host
      t.string :ip_address
      t.string :win7
      t.string :winxp
      t.string :asset_tag
      t.string :serial_no
      t.text :comment
      
      t.timestamps
    end
  end
end

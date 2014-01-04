class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :printer
      t.string :location
      t.string :host_server
      t.string :ip_address
      t.string :win_7
      t.string :win_xp
      t.string :asset_tag
      t.string :serial_number
      t.text :comment

      t.timestamps
    end
  end
end

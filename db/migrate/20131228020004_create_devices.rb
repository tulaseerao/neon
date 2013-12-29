class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :key
      t.string :computer_name
      t.string :device_type
      t.string :assignment
      t.string :location
      t.string :change
      t.date :date_in_service
      t.string :asset_tag
      t.string :serial_number
      t.string :manufacturer
      t.date :disposal_date
      t.string :mac1
      t.string :mac2
      t.string :cpu
      t.string :ghz
      t.string :core
      t.string :hdd
      t.string :screen

      t.timestamps
    end
  end
end

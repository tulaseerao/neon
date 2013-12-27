class CreateIdevice < ActiveRecord::Migration
  def change
    create_table :idevices do |t|
      t.string :name
      t.string :device_type
      t.string :model_number
      t.string :hd_capacity
      t.string :serial_number
      t.string :asset_tag

      t.timestamps
    end
  end
end

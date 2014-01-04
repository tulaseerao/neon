class CreateIdevices < ActiveRecord::Migration
  def change
    create_table :idevices do |t|
      t.string :device_type
      t.string :model_number
      t.string :capacity_hd
      t.string :serial_number
      t.string :asset_tag
      t.string :name

      t.timestamps
    end
  end
end

class CreateAvDevices < ActiveRecord::Migration
  def change
    create_table :av_devices do |t|
      t.string :status
      t.string :asset_tag
      t.string :device
      t.string :location
      t.string :brand
      t.string :model
      t.string :serial_number
      t.string :value
      t.string :lease
      t.string :lease_term
      t.string :owner_or_teacher
      t.text :notes

      t.timestamps
    end
  end
end

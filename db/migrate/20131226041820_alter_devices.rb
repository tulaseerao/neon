class AlterDevices < ActiveRecord::Migration
  def change
    add_column :devices, :device_type, :string
    add_column :devices, :assignment, :string
    add_column :devices, :location, :string
    add_column :devices, :change_location, :string
    add_column :devices, :date_in_service, :date
    add_column :devices, :asset_tag, :string
    add_column :devices, :serial_no, :string
    add_column :devices, :disposal_date, :date
    add_column :devices, :mac1, :string
    add_column :devices, :mac2, :string
    add_column :devices, :cpu, :string
    add_column :devices, :ghz, :integer
    add_column :devices, :core, :string
    add_column :devices, :hdd, :string
    add_column :devices, :screen, :string
    add_column :devices, :key, :string
  end
end

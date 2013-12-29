class AddNewColumnsToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :ethernet_mac_address, :string
    add_column :devices, :wireless_mac_address, :string
    add_column :devices, :os, :string
    add_column :devices, :printer, :string
    add_column :devices, :projector, :string
    add_column :devices, :sb, :string
    add_column :devices, :age, :decimal
    add_column :devices, :notes, :text
    add_column :devices, :memory, :string
  end
end

class AddChangeLocationToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :change_location, :string
  end
end

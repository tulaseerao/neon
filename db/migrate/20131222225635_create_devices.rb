class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.text :name
      t.text :brand

      t.timestamps
    end
  end
end

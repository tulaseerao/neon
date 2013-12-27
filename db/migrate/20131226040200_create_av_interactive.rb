class CreateAvInteractive < ActiveRecord::Migration
  def change
    create_table :av_interactives do |t|
      t.string :brand
      t.string :device_type
      t.string :location
      t.string :model
      t.string :asset_tag
      t.string :serial_no
      t.string :status
      t.string :value
      t.text :lease
      t.text :lease_term
      t.string :owner
      t.text :notes      
      
      t.timestamps
    end
  end
end

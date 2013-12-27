class CreateComputerTimeline < ActiveRecord::Migration
  def change
    create_table :computer_timelines do |t|
      t.string :device
      t.date :date_of_service
      t.integer :qty
      t.timestamps
    end
  end
end

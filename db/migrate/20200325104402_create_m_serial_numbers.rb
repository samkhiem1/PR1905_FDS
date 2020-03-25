class CreateMSerialNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :serial_numbers do |t|
      t.string :serial_number
      t.timestamps
    end
  end
end

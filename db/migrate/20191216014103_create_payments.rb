class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :used_id
      t.integer :buyer_id
      t.integer :coin
      t.string :code

      t.timestamps
    end
  end
end

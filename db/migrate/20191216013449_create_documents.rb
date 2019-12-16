class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :status

      t.timestamps
    end
  end
end

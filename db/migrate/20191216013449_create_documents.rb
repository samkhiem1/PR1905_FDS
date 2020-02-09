class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

class AddDesciptionToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :name, :string
    add_column :documents, :description, :text
    add_column :documents, :attachment, :string
  end
end

class AddThumbToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :thumbnail, :text
  end
end

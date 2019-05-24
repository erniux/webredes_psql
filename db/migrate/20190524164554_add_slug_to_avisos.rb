class AddSlugToAvisos < ActiveRecord::Migration[5.2]
  def change
    add_column :avisos, :slug, :string
    add_index :avisos, :slug, unique: true
  end
end

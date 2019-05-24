class AddSlugToEventos < ActiveRecord::Migration[5.2]
  def change
    add_column :eventos, :slug, :string
    add_index :eventos, :slug, unique: true
  end
end

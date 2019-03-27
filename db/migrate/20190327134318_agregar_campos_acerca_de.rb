class AgregarCamposAcercaDe < ActiveRecord::Migration[5.2]
  def change
  	add_column :acercades, :mision, :string
  	add_column :acercades, :vision, :string
  	add_column :acercades, :valores, :string
  end
end

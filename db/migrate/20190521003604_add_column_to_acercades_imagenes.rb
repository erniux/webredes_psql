class AddColumnToAcercadesImagenes < ActiveRecord::Migration[5.2]
  def change
    add_column :acercades, :porque_socio, :text
    add_column :acercades, :imagen_inicial, :string
    add_column :acercades, :imagen_nostros, :string
  end
end

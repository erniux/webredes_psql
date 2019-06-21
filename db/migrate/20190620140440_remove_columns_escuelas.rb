class RemoveColumnsEscuelas < ActiveRecord::Migration[5.2]
  def change
  	remove_column :escuelas, :nombre
  	remove_column :certificadors, :nombre
  	remove_column :certificadors, :correo
  	remove_column :certificadors, :telefono
  end
end

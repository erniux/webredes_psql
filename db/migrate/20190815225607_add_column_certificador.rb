class AddColumnCertificador < ActiveRecord::Migration[5.2]
  def change
  	add_column :certificadors, :nombre, :string
  	add_column :certificadors, :appaterno, :string
  	add_column :certificadors, :departamento, :string
  	add_column :certificadors, :especialidad, :string
  end
end

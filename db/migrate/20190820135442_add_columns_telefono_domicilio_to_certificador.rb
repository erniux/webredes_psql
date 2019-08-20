class AddColumnsTelefonoDomicilioToCertificador < ActiveRecord::Migration[5.2]
  def change
  	remove_column :certificadors, :departamento 
  	add_column :certificadors, :telefono, :string
  	add_column :certificadors, :domicilio, :string
  end
end

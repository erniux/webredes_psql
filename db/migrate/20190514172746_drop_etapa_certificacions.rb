class DropEtapaCertificacions < ActiveRecord::Migration[5.2]
  def change  	
  	drop_table :evidencia_estandars
  	drop_table :estandares_cerficiacions
  	drop_table :etapa_certificacions
  end
end

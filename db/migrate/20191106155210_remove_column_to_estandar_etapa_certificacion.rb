class RemoveColumnToEstandarEtapaCertificacion < ActiveRecord::Migration[5.2]
  def change
  	  	 
  	  	rename_column :estandar_etapa_certificacions, :estandar_id, :num_estandar
  	  	rename_column :estandar_etapa_certificacions, :etapa_id, :num_etapa
  end
end

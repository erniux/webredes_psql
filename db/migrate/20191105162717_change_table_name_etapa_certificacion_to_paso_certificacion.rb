class ChangeTableNameEtapaCertificacionToPasoCertificacion < ActiveRecord::Migration[5.2]
  def change
  	rename_table :etapa_certificacions, :paso_certificacions
  end
end

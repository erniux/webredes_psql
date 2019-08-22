class AddColumnToEstandarEtapaCertificacionEtapaId < ActiveRecord::Migration[5.2]
  def change
    add_column :estandar_etapa_certificacions , :etapa_id, :integer
  end
end

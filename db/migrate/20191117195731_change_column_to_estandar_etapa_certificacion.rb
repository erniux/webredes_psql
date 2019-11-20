class ChangeColumnToEstandarEtapaCertificacion < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :estandar_etapa_certificacions, :procesos, index: true, foreign_key: true
  	add_reference :estandar_etapa_certificacions, :proceso, foreign_key: true
  end
end

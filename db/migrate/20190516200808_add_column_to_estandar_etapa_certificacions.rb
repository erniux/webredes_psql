class AddColumnToEstandarEtapaCertificacions < ActiveRecord::Migration[5.2]
  def change
  	add_column :estandar_etapa_certificacions, :puntaje, :text
  	add_column :estandar_etapa_certificacions, :evidencias, :text
  end
end

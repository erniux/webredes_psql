class AddColumnToEstandarEtapaCertificacion < ActiveRecord::Migration[5.2]
  def change
    add_column :estandar_etapa_certificacions, :puntaje_total, :integer
  end
end

class AddColumnToEstandarEtapaCertificacions < ActiveRecord::Migration[5.2]
  def change
    add_column :estandar_etapa_certificacions, :estandar_id, :integer
  end
end

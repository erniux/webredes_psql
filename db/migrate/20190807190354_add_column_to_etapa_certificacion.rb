class AddColumnToEtapaCertificacion < ActiveRecord::Migration[5.2]
  def change
    add_column :etapa_certificacions, :num_etapa, :integer
  end
end

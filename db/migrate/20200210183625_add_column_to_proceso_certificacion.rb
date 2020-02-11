class AddColumnToProcesoCertificacion < ActiveRecord::Migration[5.2]
  def change
    add_column :proceso_certificacions, :estatus, :boolean
  end
end

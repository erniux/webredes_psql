class ChangeColumnProcesoCertificacion < ActiveRecord::Migration[5.2]
  def change
    change_column :proceso_certificacions, :estatus, :boolean, default: 0
  end
end

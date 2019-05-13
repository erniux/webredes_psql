class AddColumntToEtapaCertificacion < ActiveRecord::Migration[5.2]
  def change
    add_column :etapa_certificacions, :etapa, :string
  end
end

class CreateEstandarEtapaCertificacions < ActiveRecord::Migration[5.2]
  def change
    create_table :estandar_etapa_certificacions do |t|
      t.text :titulo
      t.text :descripcion
      t.string :observaciones
      t.references :etapa_certificacion, foreign_key: true

      t.timestamps
    end
  end
end

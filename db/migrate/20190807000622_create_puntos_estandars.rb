class CreatePuntosEstandars < ActiveRecord::Migration[5.2]
  def change
    create_table :puntos_estandars do |t|
      t.integer :paso
      t.integer :estandar
      t.integer :puntos
      t.text :descripcion
      t.references :estandar_etapa_certificacion, foreign_key: true

      t.timestamps
    end
  end
end

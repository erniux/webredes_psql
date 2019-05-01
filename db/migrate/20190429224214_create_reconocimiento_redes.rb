class CreateReconocimientoRedes < ActiveRecord::Migration[5.2]
  def change
    create_table :reconocimiento_redes do |t|
      t.string :nombre
      t.text :descripcion
      t.references :acercades, foreign_key: true

      t.timestamps
    end
  end
end

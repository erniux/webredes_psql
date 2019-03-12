class CreateEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.string :detalle
      t.string :lugar
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.string :expòsitor

      t.timestamps
    end
  end
end

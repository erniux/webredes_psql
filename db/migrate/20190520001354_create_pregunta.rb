class CreatePregunta < ActiveRecord::Migration[5.2]
  def change
    create_table :pregunta do |t|
      t.text :pregunta
      t.text :respuesta
      t.string :autor
      t.string :tipo
      t.string :responsable

      t.timestamps
    end
  end
end

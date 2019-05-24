class CreatePreguntasCerts < ActiveRecord::Migration[5.2]
  def change
    create_table :preguntas_certs do |t|
      t.text :pregunta
      t.text :respuesta

      t.timestamps
    end
  end
end

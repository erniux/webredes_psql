class AddDefaultToPreguntasCert < ActiveRecord::Migration[5.2]
  def change
    change_column :preguntas_certs, :respuesta, :text, :default => "Respuesta Pendiente"
  end
end

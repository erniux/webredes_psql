class RemoveIndexEscuelas < ActiveRecord::Migration[5.2]
  def change
  	remove_index "escuelas",   name: "index_escuelas_on_certificador_id"
    remove_index "escuelas",   name: "index_escuelas_on_user_id"
  end
end

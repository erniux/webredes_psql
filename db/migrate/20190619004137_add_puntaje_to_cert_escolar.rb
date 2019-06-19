class AddPuntajeToCertEscolar < ActiveRecord::Migration[5.2]
  def change
    add_column :cert_escolars, :puntaje, :float
  end
end

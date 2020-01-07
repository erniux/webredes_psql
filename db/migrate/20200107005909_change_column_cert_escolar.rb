class ChangeColumnCertEscolar < ActiveRecord::Migration[5.2]
  def change
    change_column :cert_escolars, :puntaje, :integer
  end
end

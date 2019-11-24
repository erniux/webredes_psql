class AddReferenceToCertEscolar < ActiveRecord::Migration[5.2]
  def change
    add_reference :cert_escolars, :proceso_certificacion, foreign_key: true
  end
end

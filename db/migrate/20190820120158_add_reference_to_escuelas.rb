class AddReferenceToEscuelas < ActiveRecord::Migration[5.2]
  def change
    add_reference :escuelas, :certificador, foreign_key: true
  end
end

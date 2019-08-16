class AddColumnToUserEscuelaAsReference < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :escuela, index: true, foreign_key: true
  end
end

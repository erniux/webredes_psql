class AddColumnUserToRecurso < ActiveRecord::Migration[5.2]
  def change
  	    add_reference :recursos, :user, foreign_key: true
  end
end

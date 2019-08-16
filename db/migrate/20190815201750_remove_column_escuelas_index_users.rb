class RemoveColumnEscuelasIndexUsers < ActiveRecord::Migration[5.2]
  def change
  	  	remove_reference :cert_escolars, :user, index: true, foreign_key: true
  	  	add_reference :cert_escolars, :escuela, index: true, foreign_key: true
  end
end

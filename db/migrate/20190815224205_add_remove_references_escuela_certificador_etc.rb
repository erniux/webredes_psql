class AddRemoveReferencesEscuelaCertificadorEtc < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :users, :escuela, index: true, foreign_key: true
  	remove_reference :certificadors, :user, index: true, foreign_key: true
  	 
  end
end

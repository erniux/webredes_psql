class AddColumnUserToAcercade < ActiveRecord::Migration[5.2]
  def change
  	    add_reference :acercades, :user, foreign_key: true
  end
end




class AddColumnUserToAviso < ActiveRecord::Migration[5.2]
  def change
    add_reference :avisos, :user, foreign_key: true
  end
end

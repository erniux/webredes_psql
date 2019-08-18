class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :escuela, foreign_key: true
  end
end

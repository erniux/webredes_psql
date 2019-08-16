class RemoveForeignKeyFromEscuelas < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key "escuelas", "certificadors"
  	remove_foreign_key "escuelas", "users"
  end
end

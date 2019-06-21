class AddForeignKeyToCertificadors < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :certificadors, :users 
  end
end

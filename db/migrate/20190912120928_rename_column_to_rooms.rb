class RenameColumnToRooms < ActiveRecord::Migration[5.2]
  def change
  	rename_column :rooms, :name_string, :nombre
  end
end

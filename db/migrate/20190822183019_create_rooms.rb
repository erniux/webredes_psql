class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name_string

      t.timestamps
    end
    add_index :rooms, :name_string, unique: true
  end
end

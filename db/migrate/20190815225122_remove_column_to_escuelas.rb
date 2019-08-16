class RemoveColumnToEscuelas < ActiveRecord::Migration[5.2]
  def change
  	remove_column :escuelas, :user_id
    remove_column :escuelas, :certificador_id
  end
end

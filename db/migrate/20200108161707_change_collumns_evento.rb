class ChangeCollumnsEvento < ActiveRecord::Migration[5.2]
  def change
    rename_column :eventos, :fecha_inicio, :start
    rename_column :eventos, :fecha_fin, :end
  end
end

class AddColumnToEvento < ActiveRecord::Migration[5.2]
  def change
    add_column :eventos, :color, :string
  end
end

class AddColumnToPrecios < ActiveRecord::Migration[5.2]
  def change
    add_column :precios, :tipo, :string
  end
end

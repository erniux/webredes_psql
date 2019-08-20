class AddColumnToCertificador < ActiveRecord::Migration[5.2]
  def change
    add_column :certificadors, :email, :string
  end
end

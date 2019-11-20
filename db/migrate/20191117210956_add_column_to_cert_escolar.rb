class AddColumnToCertEscolar < ActiveRecord::Migration[5.2]
  def change
    add_column :cert_escolars, :proceso, :string
  end
end

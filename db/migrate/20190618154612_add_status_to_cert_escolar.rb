class AddStatusToCertEscolar < ActiveRecord::Migration[5.2]
  def change
    add_column :cert_escolars, :status, :integer, default: 0
  end
end

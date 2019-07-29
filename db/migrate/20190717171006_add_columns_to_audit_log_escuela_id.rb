class AddColumnsToAuditLogEscuelaId < ActiveRecord::Migration[5.2]
  def change
    add_column :audit_logs, :escuela_id, :integer
  end
end

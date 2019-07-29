class DeleteColumnsToAuditLog < ActiveRecord::Migration[5.2]
  def change
  	  	remove_column :audit_logs, :status_certificacion
  end
end

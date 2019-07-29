class AddColumnsToAuditLog < ActiveRecord::Migration[5.2]
  def change
  	add_column :audit_logs, :paso, :integer
  	add_column :audit_logs, :estandar, :integer
  	add_column :audit_logs, :puntaje, :float
  	add_column :audit_logs, :certificador_id, :integer
  	remove_column :audit_logs, :start_date
  	remove_column :audit_logs, :end_date
  end
end
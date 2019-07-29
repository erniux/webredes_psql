class CreateAuditLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :audit_logs do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :status, default: 0
      t.date :start_date
      t.date :end_date
      t.text :comentarios
      t.integer :status_certificacion

      t.timestamps
    end
  end
end
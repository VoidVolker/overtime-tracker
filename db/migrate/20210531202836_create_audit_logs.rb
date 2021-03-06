class CreateAuditLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :audit_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.date :started
      t.date :ended

      t.timestamps
    end
  end
end

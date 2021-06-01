class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1 }

  belongs_to :user
  attribute :started, :date, default: -> { AuditLog.started_init_value }

  validates_presence_of :user_id, :status, :started

  def self.started_init_value
    Date.today.beginning_of_week.last_week
  end
end

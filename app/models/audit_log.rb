class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1 }

  belongs_to :user
  attribute :started, :date, default: -> { AuditLog.started_init_value }

  validates_presence_of :user_id, :status, :started

  before_update :set_ended

  def self.started_init_value
    Date.today.beginning_of_week.last_week
  end

  private
    def set_ended
      self.ended = Date.today
    end
end
Added update callback for audit log when it status changed to confirmed
class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }

  scope :with_status, ->(status) { where(status: Post.statuses[status]) }
  scope :posts_by, ->(user) { where(user_id: user.id) }

  after_save :confirm_audit_log, if: :submitted?
  after_save :unconfirm_audit_log, if: :rejected?

  def to_json(options={})
    options[:except] ||= [:user_id]
    super(options)
  end

  private

    def confirm_audit_log
      audit_log = get_audit_log
      audit_log.confirmed! if audit_log
    end

    def unconfirm_audit_log
      audit_log = get_audit_log
      audit_log.confirmed! if audit_log
    end

    def get_audit_log
      AuditLog.where(user_id: self.user_id, started: (self.date - 7.days..self.date)).last
    end
end

class AuditLogPolicy < ApplicationPolicy
  def index?
    # is_admin?
    admin_types.include?(user.type)
  end
end
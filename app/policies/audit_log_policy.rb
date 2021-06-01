class AuditLogPolicy < ApplicationPolicy
  def index?
    is_admin?
  end
end
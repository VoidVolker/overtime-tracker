class AuditLogPolicy < ApplicationPolicy
  def index?
    ApplicationHelper.is_admin? user
  end
end
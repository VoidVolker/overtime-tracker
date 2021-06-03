class AuditLogPolicy < ApplicationPolicy
  def index?
    Admin.is? user
  end
end
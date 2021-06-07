class AuditLogPolicy < ApplicationPolicy
  def index?
    ApplicationController.is_admin? user
  end

  def confirm?
    record.user_id == user.id
  end
end
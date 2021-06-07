class AuditLogPolicy < ApplicationPolicy
  def index?
    ApplicationController.is_admin? user
  end
end
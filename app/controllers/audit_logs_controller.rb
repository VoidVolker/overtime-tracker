class AuditLogsController < ApplicationController
  def index
    authorize AuditLog
    @audit_logs = AuditLog.all.page(params[:page])
  end
end

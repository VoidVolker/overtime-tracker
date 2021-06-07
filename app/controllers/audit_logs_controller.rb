class AuditLogsController < ApplicationController
  def index
    authorize AuditLog
    @audit_logs = AuditLog.all.page(params[:page])
  end

  def confirm
    @audit_log = current_user.audit_logs.find(params[:id])
    authorize @audit_log
    @audit_log.confirmed!
    render json: @audit_log.as_json
  end
end

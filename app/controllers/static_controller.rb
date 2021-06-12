class StaticController < ApplicationController
  def home
    if is_admin?
      @pending_approvals = Post.submitted
    else
      @pending_confirmations = current_user.audit_logs.pending.by_start_date
    end
  end
end
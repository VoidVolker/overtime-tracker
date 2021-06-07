class StaticController < ApplicationController
  def home
    if is_admin?
      @pending_approvals = Post.submitted
    else
      @pending_confirmations = current_user.audit_logs.order(:started)
    end
  end
end
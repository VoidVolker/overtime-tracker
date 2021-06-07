class StaticController < ApplicationController
  def home
    if is_admin?
      @pending_approvals = Post.submitted
    else

    end
  end
end
class StaticController < ApplicationController
  def home
    @pending_approvals = Post.submitted

  end
end
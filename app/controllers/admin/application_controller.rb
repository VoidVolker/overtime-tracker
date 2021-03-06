# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      unless ApplicationHelper.is_admin? current_user
        flash[:alert] = 'You are not authorized to access this page.'
        redirect_to(root_path)
      end
    end
  end
end

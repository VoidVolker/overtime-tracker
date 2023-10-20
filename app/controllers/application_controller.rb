class ApplicationController < ActionController::Base
  include Pundit::Authorization

  add_flash_types :primary, :success, :warning, :danger
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def self.is_admin?(user)
    ApplicationController.admin_types.include?(user.try(:type))
  end

  def is_admin?
    ApplicationController.admin_types.include?(current_user.try(:type))
  end

  private

    def user_not_authorized
      flash[:danger] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def self.admin_types
      ['AdminUser']
    end
end

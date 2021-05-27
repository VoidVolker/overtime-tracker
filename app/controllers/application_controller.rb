class ApplicationController < ActionController::Base
  add_flash_types :primary, :success, :warning, :danger
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end

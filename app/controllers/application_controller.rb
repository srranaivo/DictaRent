class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  add_flash_types :info, :error, :success

  def after_sign_in_path_for(resource)
    lands_path
  end
end

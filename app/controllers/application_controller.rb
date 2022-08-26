class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notification

  add_flash_types :info, :error, :success

  def after_sign_in_path_for(resource)
    lands_path
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def set_notification
    unless current_user&.dictator?
      @notification = nil
      return
    end
    land_periodes_for_land = current_user.land.land_periodes
    land_periodes_for_land.each do | periode |

      p 'periode is'
      p periode.read
      p ''

      if !periode.read
        @notification = 1
      end
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  respond_to :json
  helper_method :calculate_average_position
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def angular
    render '/layouts/application'
  end

  def calculate_average_position(results)
    if results.length > 0
      latLngAv = [0,0]
      results.values.each do |val|
        latLngAv[0] += val[:position][0]
          latLngAv[1] += val[:position][1]
      end
      latLngAv[0] = latLngAv[0] / results.count
      latLngAv[1] = latLngAv[1] / results.count
    else
      latLngAv = nil
    end
    return latLngAv
  end

  private

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role_enum]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end

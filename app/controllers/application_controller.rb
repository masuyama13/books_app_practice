# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :zip, :address, :profile, :image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :zip, :address, :profile, :image])
    end
end

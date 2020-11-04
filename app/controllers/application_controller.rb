class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :hiragana_name_first, :hiragana_name_last, :katakana_name_first, :katakana_name_last, :date_of_birth_id])
  end
end

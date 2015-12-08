class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :set_locale

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def after_sign_in_path_for(resource)
    dashboard_page_path
  end

  private
  def current_account
    current_user.accounts.find(current_user.main_account)
  end
end

class HomeController < ApplicationController
  layout 'landing_page'
  skip_before_action :authenticate_user!
  before_filter :set_locale

  def index
  end

  def resources
  end

  def about
  end

  def contact
  end

  def help
  end

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end

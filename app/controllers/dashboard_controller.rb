class DashboardController < ApplicationController
  before_filter :set_locale

  def index

  end

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end

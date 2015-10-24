class HomeController < ApplicationController
  layout 'landing_page'
  skip_before_action :authenticate_user!

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
end

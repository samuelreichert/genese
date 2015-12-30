class SettingsController < ApplicationController
  respond_to :html, :json

  def index
    @current_account = current_account
    @categories = categories_ordered
    respond_with(@current_account)
  end

  private
  def categories_ordered
    @current_account.categories.order(:name)
  end
end

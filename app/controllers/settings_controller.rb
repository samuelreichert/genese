class SettingsController < ApplicationController
  respond_to :html, :json

  def index
    @current_account = current_account
    @categories = categories_ordered
    respond_with(@current_account)
  end

  def update
    @current_account = current_account

    respond_to do |format|
      if @current_account.update(settings_params)
        format.html { redirect_to settings_path, notice: I18n.t('activerecord.messages.account_updated') }
        format.json { render settings_path, status: :ok, location: @current_account }
      else
        format.html { render settings_path }
        format.json { render json: @current_account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def settings_params
    params.require(:account).permit(
      :entries_order,
      :currency_type,
      :reminder_days_before,
      :reminder_active
    )
  end

  def categories_ordered
    @current_account.categories.order(:name)
  end
end

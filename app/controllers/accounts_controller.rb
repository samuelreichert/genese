class AccountsController < ApplicationController
  before_action :set_account, only: [:destroy]
  respond_to :html, :json

  def index
    @accounts = current_user.accounts
  end

  # GET /entries/new
  def new
    @account = current_user.accounts.new
  end

  def create
    if account_params[:public] == '1'
      account_saved = Account::SaveAccountService.new(current_user, account_params, params[:account][:users]).save
    else
      account_saved = current_user.accounts.create!(account_params)
    end
    User::CategoryService.new(account_saved).create_categories

    respond_to do |format|
      if account_saved
        format.html { redirect_to accounts_path, notice: I18n.t('activerecord.messages.account_created') }
        format.json { render :index, status: :created, location: @account }
      else
        format.html { render :index }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @current_account = current_account

    respond_to do |format|
      if @current_account.update(update_params)
        format.html { redirect_to settings_path, notice: I18n.t('activerecord.messages.account_updated') }
        format.json { render settings_path, status: :ok, location: @current_account }
      else
        format.html { render settings_path }
        format.json { render json: @current_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    flash = Account::DestroyAccountService.new(current_user, @account).destroy
    respond_to do |format|
      format.html { redirect_to accounts_path, flash }
      format.json { head :no_content }
    end
  end

  def main_account
    account_id = params[:account_id]

    respond_to do |format|
      if current_user.update(main_account: account_id.to_i)
        format.html { redirect_to dashboard_page_path, notice: I18n.t('activerecord.messages.main_account_updated') }
        format.json { render json: {url: dashboard_page_path} }
      else
        format.html { render :index }
        format.json { render json: current_user.errors }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(
      :name,
      :owner,
      :public,
      :currency_type,
      :entries_order,
      :reminder_active,
      :reminder_days_before
    )
  end

  def update_params
    params.require(:account).permit(
      :entries_order,
      :currency_type,
      :reminder_days_before,
      :reminder_active
    )
  end
end

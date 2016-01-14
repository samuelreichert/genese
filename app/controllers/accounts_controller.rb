class AccountsController < ApplicationController
  before_action :set_account, only: [:destroy]
  respond_to :html, :json

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_user.accounts
    respond_with(@accounts)
  end

  # GET /accounts/new
  def new
    @account = current_user.accounts.new
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @user = current_user

    if account_params[:public] == '1' && params[:account][:users].present?
      @account = Account::SaveAccountService.new(@user, account_params, params[:account][:users]).save
    else
      @account = @user.accounts.create!(account_params)
    end

    if @account
      User::CategoryService.new(@account).create_categories
    end

    respond_to do |format|
      if @account
        format.html { redirect_to accounts_path, notice: I18n.t('activerecord.messages.account_created') }
        format.json { render :index, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
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

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    flash = Account::DestroyAccountService.new(current_user, @account).destroy
    respond_to do |format|
      format.html { redirect_to accounts_path, flash }
      format.json { head :no_content }
    end
  end

  # POST /leave_account
  # POST /leave_account.json
  def leave_account
    account_id = params[:account_id]
    account = Account.find(account_id)
    unlinked_account = current_user.accounts.delete(account)

    if current_user.main_account == unlinked_account.id
      current_user.update(main_account: current_user.accounts.first.id)
    end

    respond_to do |format|
      format.html { redirect_to accounts_path, notice: I18n.t('activerecord.messages.account_unlinked') }
      format.json { render json: {url: accounts_path} }
    end
  end

  # POST /main_account
  # POST /main_account.json
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

class AccountsController < ApplicationController
  respond_to :html, :json

  def index
    @account = current_account
    @categories = @account.categories
    respond_with(@account)
  end

  def show
  end

  def create
    @account = Account.new()
    @account.save

    Account::AccountService.new(@account).create_categories
    respond_with(@account)
  end

  def update
    @account.update(account_params)
    respond_with(@account)
  end

  private
  def account_params
    params.require(:account).permit(
      :entries_order,
      :currency_type,
      :reminder_days_before,
      :reminder_active
    )
  end
end

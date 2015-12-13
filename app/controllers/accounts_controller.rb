class AccountsController < ApplicationController
  respond_to :html, :json

  def index
    @account = current_account
    @categories = categories_ordered
    respond_with(@account)
  end

  def show
  end

  def create
    @account = current_user.accounts.new

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, notice: I18n.t('activerecord.messages.account_created') }
        format.json { render :index, status: :created, location: @account }
      else
        format.html { render :index }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @account = current_account

    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to accounts_path, notice: I18n.t('activerecord.messages.account_updated') }
        format.json { render accounts_path, status: :ok, location: @account }
      else
        format.html { render accounts_path }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
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

  def categories_ordered
    @account.categories.order(:name)
  end
end

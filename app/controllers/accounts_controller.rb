class AccountsController < ApplicationController
  respond_to :html, :json

  def index
    @accounts = current_user.accounts
  end

  # GET /entries/new
  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)

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

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_path, notice: I18n.t('activerecord.messages.account_destroyed') }
      format.json { head :no_content }
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
end

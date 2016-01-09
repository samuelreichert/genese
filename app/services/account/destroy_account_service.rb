class Account::DestroyAccountService
  def initialize(user, account)
    @user = user
    @account = account
  end

  def destroy
    my_accounts = @user.accounts.where(owner: @user.id)

    if my_accounts.length > 1
      @account.users.clear
      account_destroyed = @account.destroy

      if account_destroyed.id == @user.main_account
        main_account_id = @user.accounts.first.id
        @user.update(main_account: main_account_id)
      end

      {notice: I18n.t('activerecord.messages.account_destroyed')}
    else
      {alert: I18n.t('activerecord.messages.cannot_destroy_one_account')}
    end
  end
end

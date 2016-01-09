class Account::SaveAccountService
  def initialize(user, account_params, users_ids)
    @user = user
    @account_params = account_params
    @users_ids = users_ids
  end

  def save
    account = @user.accounts.create!(@account_params)

    @users_ids.each do |user_id|
      user = User.find(user_id)
      account.users << user
    end

    account
  end
end

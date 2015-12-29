class User::RegistrationService
  def initialize(resource)
    @user = resource
  end

  def destroy_accounts
    my_accounts = @user.accounts.where(owner: @user.id)

    my_accounts.each do |account|
      account.destroy
    end

    @user.accounts.clear
  end
end

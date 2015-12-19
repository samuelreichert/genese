class User::SignupService
  def initialize(resource, mailer = Mailers::WelcomeMessage)
    @user = resource
    @mailer = mailer
  end

  def create_account
    account = @user.accounts.create()
    @user.update(main_account: account.id)

    send_welcome_email

    account
  end

  private
  def send_welcome_email
    @mailer.perform @user
  end
end

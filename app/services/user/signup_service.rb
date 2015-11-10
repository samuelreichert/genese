class User::SignupService
  def initialize(resource, mailer = Mailers::WelcomeMessage)
    @user = resource
    @mailer = mailer
  end

  def create_account
    @user.accounts.create()

    send_welcome_email
    # Exemplos do Matias
    # resource.accounts.create()
    # Account.create!(users: [resource], foo: :bar)
  end

  private
  def send_welcome_email
    @mailer.perform @user
  end
end

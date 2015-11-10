class UserMailer < BaseMailer
  def welcome_message user
    @user = user

    mandrill_mail(
      template: 'welcome-template',
      subject: 'Seja bem-vindo ao Gênese',
      to: @user.email,
      vars: {'NAME' => @user.name}
    )
  end
end

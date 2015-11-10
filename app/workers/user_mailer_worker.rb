class UserMailerWorker
  include Sidekiq::Worker
  sidekiq_options queue: :email

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.welcome_message(user).deliver
  end
end

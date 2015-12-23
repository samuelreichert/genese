class NotificationMailerWorker
  include Sidekiq::Worker
  sidekiq_options queue: :email

  def perform(user, account, entry)
    NotificationMailer.notification_message(user, account, entry).deliver
  end
end

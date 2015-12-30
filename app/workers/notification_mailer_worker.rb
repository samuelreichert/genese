class NotificationMailerWorker
  include Sidekiq::Worker
  sidekiq_options queue: :email

  def perform(user_id, account_id, entry_id)
    user = User.find(user_id)
    account = Account.find(account_id)
    entry = Entry.find(entry_id)

    NotificationMailer.notification_message(user, account, entry).deliver
  end
end

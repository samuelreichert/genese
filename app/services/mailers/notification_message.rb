class Mailers::NotificationMessage
  def self.perform user, account, entry
    NotificationMailerWorker.perform_async(user, account, entry)
  end
end

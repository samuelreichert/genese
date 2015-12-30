class Mailers::NotificationMessage
  def self.perform user_id, account_id, entry_id
    NotificationMailerWorker.perform_async(user_id, account_id, entry_id)
  end
end

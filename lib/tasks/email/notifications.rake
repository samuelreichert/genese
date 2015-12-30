namespace :email do
  desc 'Send an email notifying the deadline of an expense'
  task notifications: :environment do
    User.find_each do |user|
      user_accounts = user.accounts.where(reminder_active: true, owner: user.id)

      user_accounts.each do |account|
        days_before = account.reminder_days_before
        date_to_compare = Date.today + days_before

        user_entries = account.entries.where(paid: false, date: date_to_compare, entries_type: :expense)

        user_entries.each do |entry|
          Mailers::NotificationMessage.perform(user.id, account.id, entry.id)
        end
      end
    end
  end
end

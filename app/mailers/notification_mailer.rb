class NotificationMailer < BaseMailer
  def notification_message user, account, entry
    @user = user
    @account = account
    @entry = entry

    @value = number_to_currency(@entry.value, unit: @account.read_attribute('currency_type'), separator: ",", delimiter: ".")
    @date = I18n.l(@entry.date)

    mandrill_mail(
      template: 'notification-template',
      subject: 'Gênese - Você tem contas que vão vencer',
      to: @user.email,
      vars: {
        'NAME' => @user.name,
        'ACCOUNT_NAME' => @account.name,
        'ACCOUNT_DAYS_BEFORE' => @account.reminder_days_before,
        'ENTRY_DESCRIPTION' => @entry.description,
        'VALUE' => @value,
        'DATE' => @date,
        'CATEGORY' => @entry.category.name,
        'COLOR' => @entry.category.color
      }
    )
  end
end

class DashboardController < ApplicationController
  def index
    @account = current_account
    @entries = month_entries

    @incomes = @entries.where(entries_type: 'income')
    @expenses = @entries.where(entries_type: 'expense')

    @balance = @incomes.map { |i| i[:value] }.sum
    @expenditure = @expenses.map { |e| e[:value] }.sum

    @currency_simbol = mount_currency_simbol
  end

  private
  def month_entries
    @account.entries.where(
      date: Date.today.beginning_of_month..Date.today.end_of_month
    )
  end

  def mount_currency_simbol
    Account.currency_types[@account.currency_type]
  end
end

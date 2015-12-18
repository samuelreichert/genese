class DashboardController < ApplicationController
  def index
    @current_account = current_account
    @entries = current_entries

    mount_entries_lists
    mount_totalizers
  end

  private
  def current_entries
    begin_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month
    @current_account.entries.where(date: begin_date...end_date)
  end

  def mount_entries_lists
    @all_incomes = @entries.where(entries_type: 'income')
    @all_expenses = @entries.where(entries_type: 'expense')

    @incomes = @all_incomes.where(paid: false)
    @expenses = @all_expenses.where(paid: false)
  end

  def mount_totalizers
    @totalizer_incomes = @all_incomes.sum :value
    @totalizer_expenses = @all_expenses.sum :value
  end
end

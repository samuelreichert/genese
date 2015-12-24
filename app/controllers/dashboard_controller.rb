class DashboardController < ApplicationController
  def index
    @current_account = current_account
    @entries = account_entries(@current_account)

    mount_entries_lists(@entries)
    mount_totalizers

    top_categories_entries(@current_account, @entries)
  end

  def top_categories_entries account, entries
    @categories = top_categories_totalizer(account, entries)
  end

  private
  def account_entries account
    begin_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month

    account.entries.where(date: begin_date...end_date)
  end

  def mount_entries_lists entries
    @all_incomes = select_entries(entries, 'income')
    @all_expenses = select_entries(entries, 'expense')

    @incomes = @all_incomes.where(paid: false)
    @expenses = @all_expenses.where(paid: false)
  end

  def select_entries entries, entry_type
    entries.where(entries_type: entry_type).order(date: :asc, description: :asc)
  end

  def mount_totalizers
    @totalizer_incomes = @all_incomes.sum :value
    @totalizer_expenses = @all_expenses.sum :value
  end

  def top_categories_totalizer account, entries
    expenses = select_entries(entries, 'expense')
    account_categories = account.categories
    categories = Array.new

    account_categories.each do |category|
      expenses_category = expenses.where(category_id: category.id)

      if expenses_category.length > 0
        expenses_sum = expenses_category.sum :value
        formatted_value = format_value(expenses_sum, account.read_attribute('currency_type'))

        categories.push({
          category: category.name,
          value: expenses_sum,
          color: category.color,
          label: "#{category.name} - #{formatted_value}"
        })
      end
    end

    if categories.length > 0
      categories.sort! { |x,y| y[:value] <=> x[:value] }
    end

    categories
  end

  def format_value value, unit
    view_context.number_to_currency(value, unit: unit, separator: ",", delimiter: ".")
  end
end

class ReportsController < ApplicationController
  def index
    @current_date = (params[:current_date] || Date.today).to_date
    @current_account = current_account
    entries = account_entries(@current_account, @current_date)

    @expenses = select_entries(entries, 'expense')
    @incomes = select_entries(entries, 'income')

    mount_date_links(@current_date)
    mount_totalizers(@expenses, @incomes)

    @expenses_categories = mount_entries_categories(@current_account, @expenses)
    @incomes_categories = mount_entries_categories(@current_account, @incomes)
  end

  private
  def account_entries account, date
    date_begin = date.beginning_of_month
    date_end = date.end_of_month

    account.entries
      .where(date: date_begin..date_end)
      .order(date: :asc, description: :asc)
  end

  def select_entries entries, entry_type
    entries.where(entries_type: entry_type).order(category_id: :asc, date: :asc, description: :asc)
  end

  def mount_date_links date
    last_month = date - 1.month
    next_month = date + 1.month

    @last_month_path = reports_path(current_date: last_month)
    @next_month_path = reports_path(current_date: next_month)
  end

  def mount_totalizers expenses, incomes
    @totalizer_expenses = expenses.sum :value
    @totalizer_incomes = incomes.sum :value
    @total_entries = {
      labels: ["Receitas","Despesas"],
      datasets: [{
        fillColor: ["#2ecc71","#e74c3c"],
        data: [@totalizer_incomes, @totalizer_expenses]
      }]
    }
  end

  def mount_entries_categories account, entries
    account_categories = account.categories
    categories = Array.new

    account_categories.each do |category|
      entries_category = entries.where(category_id: category.id)

      if entries_category.length > 0
        entries_sum = entries_category.sum :value
        formatted_value = format_value(entries_sum, account.read_attribute('currency_type'))

        categories.push({
          category: category.name,
          value: entries_sum,
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
end

class Entry::SearchEntries
  def initialize()
  end

  def call(account, params)
    current_date = (params[:current_date] || Date.today).to_date
    category_id = params[:category]
    description = params[:description]

    begin_date = current_date.beginning_of_month
    end_date = current_date.end_of_month
    order = if account.entries_order == 'crescent' then :asc else :desc end

    entries = account.entries
      .where(date: begin_date..end_date)
      .order(date: order, description: order)

    if category_id.present?
      entries = entries.where(category_id: category_id)
    end

    if description.present?
      entries = entries.search_by_description(description)
    end

    entries
  end
end

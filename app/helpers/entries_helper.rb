module EntriesHelper
  def formatted_current_date(current_date)
    date = "&nbsp; #{I18n.t("date.month_names")[current_date.month]} de #{current_date.year} &nbsp;"
    date.html_safe
  end
end

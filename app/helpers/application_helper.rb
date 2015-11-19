module ApplicationHelper

  def alert_class(flash_key)
    case flash_key
    when "notice" then "success"
    when "alert" then "danger"
    end
  end
end

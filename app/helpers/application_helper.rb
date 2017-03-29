module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice then
        "alert alert-info"
      when :success then
        "alert alert-success"
      when :error then
        "alert alert-danger"
      when :alert then
        "alert alert-warning"
      else
        "alert #{level}"
    end
  end

  def is_active(link_path)
    current_page?(link_path) ? 'active' : nil
  end

  def summ_delimeter(x)
    str = x.to_s.reverse
    str.gsub!(/([0-9]{3})/, "\\1 ")
    str.gsub(/,$/, "").reverse
  end

  def currency(value)
    case value
      when 'rub' then
        "&#8381;".html_safe
      when 'eur' then
        "&euro;".html_safe
      when 'usd' then
        "&dollar;".html_safe
    end
  end

  def request_status(value)
    case value.to_s
      when '1' then
        "Черновик"
      when '2' then
        "Ожидает подписи"
      when '3' then
        "Передано в банк"
      when '4' then
        "Ожидается оплата"
      when '5' then
        "БГ отправлена"
      when '6' then
        "Отказанные"
    end
  end

end

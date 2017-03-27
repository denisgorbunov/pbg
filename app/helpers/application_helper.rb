module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
      when :alert then "alert alert-warning"
      else "alert #{level}"
    end
  end

  def is_active(link_path)
    current_page?(link_path) ? 'active' : nil
  end

end

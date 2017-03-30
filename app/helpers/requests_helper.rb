module RequestsHelper
  def client(client_id)
    Client.find(client_id)
  end

  def user(user_id)
    User.find(user_id)
  end

  def bg_type(value)
    case value.to_s
      when '1' then
        "Коммерческая"
      when '0' then
        "Госзакупка"
    end
  end


  def yes_no(value)
    case value.to_s
      when 'true' then
        "Да"
      when 'false' then
        "Нет"
    end
  end


end
